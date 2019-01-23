
/** 버퍼 변환 */
function base64ToArrayBuffer(base64) {
    var binaryString = window.atob(base64);
    var binaryLen = binaryString.length;
    var bytes = new Uint8Array(binaryLen);
    for (var i = 0; i < binaryLen; i++) {
       var ascii = binaryString.charCodeAt(i);
       bytes[i] = ascii;
    }
    return bytes;
}

/** 테이블의 체크박스 클릭했을 때 데이터 저장 */
function tableCheckboxClick(table) {
	var rows_selected = [];
	
	table.on("change", "tbody tr .m-checkbox", function() {
		var row = $(this).closest('tr');
        var data = dataTable.table.row(row).data();
        console.log(row);
        console.log(data);
        rows_selected.push(data);
    })
}