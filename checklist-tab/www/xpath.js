// See http://stackoverflow.com/questions/10596417/is-there-a-way-to-get-element-by-xpath-in-javascript
function getElementByXpath(path) {
    return document.evaluate(path, document, null, XPathResult.ANY_TYPE, null); 
}
