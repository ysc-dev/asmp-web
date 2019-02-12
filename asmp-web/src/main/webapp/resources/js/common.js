
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

function fileDownload(data) {
  	var file = base64ToArrayBuffer(data.content);
   	var a = document.createElement('a');
   	a.href = window.URL.createObjectURL(new Blob([file]));
   	a.download = data.fileName;
   	// Firefox에서 다운로드 안되는 문제 수정용 코드
   	// (Firefox는 a가 화면에 실존할 때만 다운로드 가능)
   	document.body.appendChild(a);
   	a.click();
   	document.body.removeChild(a); 
}

$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function selectAdd(id, value, text) {
	$(id).append($('<option>', {
	    value: value,
	    text: text
	}));
}