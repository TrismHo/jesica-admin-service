/*
 * strTemp  : [필수] 크로스사이트 스크립팅을 검사할 문자열
 * level    : [옵션] 검사레벨
 *            0 (기본) -> XSS취약한 문자 제거
 *            1 (선택) -> 단순한 <, > 치환
 */
function XSSCheck(strTemp, level) {
    if (level === undefined || level === 0) {
        strTemp = strTemp.replace(/\<|\>|\"|\'|\%|\;|\(|\)|\&|\+|\-/g, "");
    } else if (level !== undefined && level === 1) {
        strTemp = strTemp.replace(/\</g, "&lt;");
        strTemp = strTemp.replace(/\>/g, "&gt;");
    }
    return strTemp;
}


let encEntityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '`': '&#x60;',
    '=': '&#x3D;'
};

let decEntityMap = {
    '&amp;' : '&',
    '&lt;'  : '<',
    '&gt;'  : '>',
    '&quot;': '"',
    '&#39;' : "'",
    '&#x2F;': '/',
    '&#x60;': '`',
    '&#x3D;': '=',
    '&copy;': '©',
    '&#32;' : ' ',
    '&#40;' : '(',
    '&#41;' : ')',
    '&#41' : ')',
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'`=\/]/g, function fromEntityMap(s) {
        return encEntityMap[s];
    });
}

function unEscapeHtml(string) {
    return String(string).replace(/\&[#0-9a-z]+;/gi, function fromEntityMap(s) {
        return decEntityMap[s];
    });
}