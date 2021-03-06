package co.id.spring.mvc.sys.util;

import java.util.Iterator;
import java.util.Map;

/**
 * Provides a HTML element StringBuffer for rendering, automatically
 * escaping string values. HtmlStringBuffer is used by Click controls
 * for HTML rendering.
 * <p/>
 * For example the following code:
 * <pre class="codeJava">
 * <span class="kw">public</span> String toString() {
 *     HtmlStringBuffer buffer = <span class="kw">new</span> HtmlStringBuffer();
 *
 *     buffer.elementStart(<span class="st">"input"</span>);
 *     buffer.appendAttribute(<span class="st">"type"</span>, <span class="st">"text"</span>);
 *     buffer.appendAttribute(<span class="st">"name"</span>, getName());
 *     buffer.appendAttribute(<span class="st">"value"</span>, getValue());
 *     buffer.elementEnd();
 *
 *     <span class="kw">return</span> buffer.toString();
 * } </pre>
 *
 * Would render:
 *
 * <pre class="codeHtml">
 * &lt;input type="text" name="address" value="23 Holt's Street"/&gt; </pre>
 *
 * <h4>Synchronization</h4>
 *
 * To improve performance in Click's thread safe environment this
 * class does not synchronize append operations. Internally this class uses
 * a character buffer adapted from the JDK 1.5 <tt>AbstractStringBuilder</tt>.
 *
 * @author Malcolm Edgar
 */
public class HtmlStringBuffer {

    // -------------------------------------------------------------- Constants

    /** JavaScript attribute names. */
    static final String[] JS_ATTRIBUTES = {
       "onload", "onunload", "onclick", "ondblclick", "onmousedown",
       "onmouseup", "onmouseover", "onmousemove", "onmouseout", "onfocus",
       "onblur", "onkeypress", "onkeydown", "onkeyup", "onsubmit", "onreset",
       "onselect", "onchange"
    };

    // ----------------------------------------------------- Instance Variables

    /** The character storage array. */
    protected char[] characters;

    /** The count is the number of characters used. */
    protected int count;

    // ----------------------------------------------------------- Constructors

    /**
     * Create a new HTML StringBuffer with the specified initial
     * capacity.
     *
     * @param length the initial capacity
     */
    public HtmlStringBuffer(int length) {
        characters = new char[length];
    }

    /**
     * Create a new HTML StringBuffer with an initial capacity of 128
     * characters.
     */
    public HtmlStringBuffer() {
        characters = new char[128];
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Append the char value to the buffer.
     *
     * @param value the char value to append
     */
    public void append(char value) {
        int newcount = count + 1;
        if (newcount > characters.length) {
            expandCapacity(newcount);
        }
        characters[count++] = value;
    }

    /**
     * Append the integer value to the buffer.
     *
     * @param value the integer value to append
     */
    public void append(int value) {
        append(String.valueOf(value));
    }

    /**
     * Append the long value to the buffer.
     *
     * @param value the long value to append
     */
    public void append(long value) {
        append(String.valueOf(value));
    }

    /**
     * Append the raw object value of the given object to the buffer.
     *
     * @param value the object value to append
     */
    public void append(Object value) {
        String string = String.valueOf(value);
        int length = string.length();

        int newCount = count + length;
        if (newCount > characters.length) {
            expandCapacity(newCount);
        }
        string.getChars(0, length, characters, count);
        count = newCount;
    }

    /**
     * Append the raw string value of the given object to the buffer.
     *
     * @param value the string value to append
     */
    public void append(String value) {
        String string = (value != null) ? value : "null";
        int length = string.length();

        int newCount = count + length;
        if (newCount > characters.length) {
            expandCapacity(newCount);
        }
        string.getChars(0, length, characters, count);
        count = newCount;
    }

    /**
     * Append the given value to the buffer and escape its HMTL value.
     *
     * @param value the object value to append
     * @throws IllegalArgumentException if the value is null
     */
    public void appendEscaped(Object value) {
        if (value == null) {
            throw new IllegalArgumentException("Null value parameter");
        }

        String string = value.toString();
        int length = string.length();
        char aChar;
        for (int i = 0; i < length; i++) {
            aChar = string.charAt(i);

            if (StringUtils.requiresEscape(aChar)) {
                append(StringUtils.escapeChar(aChar));

            } else {
                append(aChar);
            }
        }
    }

    /**
     * Append the given attribute name and value to the buffer, if the value
     * is not null.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    appendAttribute(<span class="st">"class"</span>, <span class="st">"required"</span>)  <span class="green">-></span>  <span class="st">class="required"</span> </pre>
     *
     * The attribute value will be HMTL escaped. If the attribute name is a
     * JavaScript event handler the value will not be escaped.
     *
     * @param name the HTML attribute name
     * @param value the object value to append
     * @throws IllegalArgumentException if name is null
     */
    public void appendAttribute(String name, Object value) {
        if (name == null) {
            throw new IllegalArgumentException("Null name parameter");
        }
        if (value != null) {
            append(" ");
            append(name);
            append("=\"");
            if (isJavaScriptAttribute(name)) {
                append(value);
            } else {
                appendEscaped(value.toString());
            }
            append("\"");
        }
    }

    /**
     * Append the given HTML attribute name and value to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    appendAttribute(<span class="st">"size"</span>, 10)  <span class="green">-&gt;</span>  <span class="st">size="10"</span> </pre>
     *
     * @param name the HTML attribute name
     * @param value the HTML attribute value
     * @throws IllegalArgumentException if name is null
     */
    public void appendAttribute(String name, int value) {
        if (name == null) {
            throw new IllegalArgumentException("Null name parameter");
        }
        append(" ");
        append(name);
        append("=\"");
        append(value);
        append("\"");
    }

    /**
     * Append the HTML "disabled" attribute to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    appendAttributeDisabled()  <span class="green">-></span>  <span class="st">disabled="disabled"</span> </pre>
     */
    public void appendAttributeDisabled() {
        append(" disabled=\"disabled\"");
    }

    /**
     * Append the HTML "readonly" attribute to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    appendAttributeReadonly()  <span class="green">-></span>  <span class="st">readonly="readonly"</span> </pre>
     */
    public void appendAttributeReadonly() {
        append(" readonly=\"readonly\"");
    }

    /**
     * Append the given map of attribute names and values to the string buffer.
     *
     * @param attributes the map of attribute names and values
     * @throws IllegalArgumentException if attributes is null
     */
    @SuppressWarnings({"rawtypes" })
	public void appendAttributes(Map attributes) {
        if (attributes == null) {
            throw new IllegalArgumentException("Null attributes parameter");
        }
        for (Iterator i = attributes.entrySet().iterator(); i.hasNext();) {
            Map.Entry entry = (Map.Entry) i.next();
            String name = entry.getKey().toString();

            if (!name.equals("id")) {
                Object value = entry.getValue();
                appendAttribute(name, value);
            }
        }
    }

    /**
     * Append the given map of CSS style name and value pairs as a style
     * attribute to the string buffer.
     *
     * @param attributes the map of CSS style names and values
     * @throws IllegalArgumentException if attributes is null
     */
    @SuppressWarnings({"rawtypes" })
	public void appendStyleAttributes(Map attributes) {
        if (attributes == null) {
            throw new IllegalArgumentException("Null attributes parameter");
        }

        if (!attributes.isEmpty()) {
            append(" style=\"");

            for (Iterator i = attributes.entrySet().iterator(); i.hasNext();) {
                Map.Entry entry = (Map.Entry) i.next();
                String name = entry.getKey().toString();
                String value = entry.getValue().toString();

                append(name);
                append(":");
                append(value);
                append(";");
            }

            append("\"");
        }
    }

    /**
     * Append a HTML element end to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    elementEnd(<span class="st">"textarea"</span>)  <span class="green">-></span>  <span class="st">&lt;/textarea&gt;</span> </pre>
     *
     * @param name the HTML element name to end
     * @throws IllegalArgumentException if name is null
     */
    public void elementEnd(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Null name parameter");
        }
        append("</");
        append(name);
        append(">");
    }

    /**
     * Append a HTML element end to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    closeTag()  <span class="green">-></span>  <span class="st">&gt;</span> </pre>
     *
     */
    public void closeTag() {
        append(">");
    }

    /**
     * Append a HTML element end to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    elementEnd()  <span class="green">-></span>  <span class="st">/&gt;</span> </pre>
     *
     */
    public void elementEnd() {
        append("/>");
    }

    /**
     * Append a HTML element start to the string buffer.
     * <p/>
     * For example:
     * <pre class="javaCode">
     *    elementStart(<span class="st">"input"</span>)  <span class="green">-></span>  <span class="st">&lt;input</span> </pre>
     *
     * @param name the HTML element name to start
     */
    public void elementStart(String name) {
        append("<");
        append(name);
    }

    /**
     * Return true if the given attribute name is a JavaScript attribute,
     * or false otherwise.
     *
     * @param name the HTML attribute name to test
     * @return true if the HTML attribute is a JavaScript attribute
     */
    public boolean isJavaScriptAttribute(String name) {
        if (name.length() < 6 || name.length() > 11) {
            return false;
        }

        if (!name.startsWith("on")) {
            return false;
        }

        for (int i = 0; i < JS_ATTRIBUTES.length; i++) {
            if (JS_ATTRIBUTES[i].equalsIgnoreCase(name)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Return the length of the string buffer.
     *
     * @return the length of the string buffer
     */
    public int length() {
        return count;
    }

    /**
     * @see Object#toString()
     *
     * @return a string representation of the string buffer
     */
    public String toString() {
        return new String(characters, 0, count);
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Ensures that the capacity is at least equal to the specified minimum.
     * If the current capacity is less than the argument, then a new internal
     * array is allocated with greater capacity. The new capacity is the
     * larger of:
     * <ul>
     * <li>The <code>minimumCapacity</code> argument.
     * <li>Twice the old capacity, plus <code>2</code>.
     * </ul>
     * If the <code>minimumCapacity</code> argument is nonpositive, this method
     * takes no action and simply returns.
     *
     * @param minimumCapacity the minimum desired capacity
     */
    protected void expandCapacity(int minimumCapacity) {
        int newCapacity = (characters.length + 1) * 2;

        if (newCapacity < 0) {
            newCapacity = Integer.MAX_VALUE;
        } else if (minimumCapacity > newCapacity) {
            newCapacity = minimumCapacity;
        }

        char newValue[] = new char[newCapacity];
        System.arraycopy(characters, 0, newValue, 0, count);
        characters = newValue;
    }

}
