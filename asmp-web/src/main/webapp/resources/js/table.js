var Datatables = {
	basic: function(id, tableOption) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다.",
				infoEmpty: "",
				info: " _TOTAL_ 개의 데이터가 있습니다."
			},
		    columns: tableOption.columns,
		    columnDefs: [
		    	{ orderable: true, className: 'reorder', targets: 0 },
		    	{ orderable: false, targets: '_all' }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: true,
		    paging: true,
		    pagingType: "full_numbers",
		    info: true,
		    pageLength: 10,
		    order: [[0, 'desc']]
		});
		
		return table;
	},
	row: function(id, tableOption, num) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다.",
				infoEmpty: "",
				info: " _TOTAL_ 개의 데이터가 있습니다."
			},
		    columns: tableOption.columns,
		    columnDefs: [
		    	{ orderable: true, className: 'reorder', targets: 0 },
		    	{ orderable: false, targets: '_all' }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: true,
		    paging: true,
		    pagingType: "full_numbers",
		    info: true,
		    pageLength: num,
		    order: [[0, 'desc']]
		});
		
		return table;
	},
	order: function(id, tableOption, num) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다.",
				infoEmpty: "",
				info: " _TOTAL_ 개의 데이터가 있습니다."
			},
		    columns: tableOption.columns,
		    columnDefs: [
		    	{ orderable: true, className: 'reorder', targets: 0 },
		    	{ orderable: true, className: 'reorder', targets: num },
		    	{ orderable: false, targets: '_all' }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: true,
		    paging: true,
		    info: true,
		    pageLength: 10
		});
		
		return table;
	},
	visible: function(id, tableOption, num) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다.",
				infoEmpty: "",
				info: " _TOTAL_ 개의 데이터가 있습니다."
			},
		    columns: tableOption.columns,
		    columnDefs: [
		    	{ orderable: true, className: 'reorder', targets: 0 },
		    	{ visible: false, targets: num },
		    	{ orderable: false, targets: '_all' }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: true,
		    pagingType: "full_numbers",
		    paging: true,
		    info: true,
		    pageLength: 10
		});
		
		return table;
	},
	check: function(id, tableOption, info, number) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다.",
				infoEmpty: "",
				info: info ? info : " 총 _TOTAL_ 명이 있습니다."
			},
			select: {
                style: "multi",
                selector: "td:first-child .m-checkable"
            },
			headerCallback: function(e, a, t, n, s) {
                e.getElementsByTagName("th")[0].innerHTML = '\n<label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">' +
                	'\n<input type="checkbox" value="" class="m-group-checkable">\n<span></span>\n</label>'
            },
		    columns: tableOption.columns,
		    columnDefs: [
		    	{
	                targets: 0,
	                className: "dt-right",
	                orderable: false,
	                render: function(e, a, t, n) {
	                    return '\n<label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">\n' + 
	                    	'<input type="checkbox" value="" class="m-checkable">\n<span></span>\n</label>'
	                }
	            },
	            { visible: false, targets: 1 },
		    	{ orderable: true, className: 'reorder', targets: 2 },
		    	{ orderable: false, targets: '_all' }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: true,
		    paging: true,
		    pagingType: "full_numbers",
		    info: true,
		    pageLength: number ? number : 10,
		    order: [[1, 'asc']]
		});
		
		table.on("change", ".m-group-checkable", function() {
            var e = $(this).closest("table").find("td:first-child .m-checkable"),
                a = $(this).is(":checked");
            $(e).each(function() {
                a ? ($(this).prop("checked", !0), $(this).closest("tr").addClass("active")) : ($(this).prop("checked", !1), $(this).closest("tr").removeClass("active"))
            })
        })
        
        table.on("change", "tbody tr .m-checkbox", function() {
            $(this).parents("tr").toggleClass("active");
        })
		
		return table;
	},
	customCheck: function(id, tableOption) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다."
			},
			select: {
                style: "multi",
                selector: "td:first-child .m-checkable"
            },
            headerCallback: function(e, a, t, n, s) {
                e.getElementsByTagName("th")[0].innerHTML = '\n<label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">' +
                	'\n<input type="checkbox" value="" class="m-group-checkable">\n<span></span>\n</label>'
            },
		    columns: tableOption.columns,
		    columnDefs: [
		    	{
	                targets: 0,
	                className: "dt-right",
	                orderable: false,
	                render: function(e, a, t, n) {
	                    return '\n<label class="m-checkbox m-checkbox--single m-checkbox--solid m-checkbox--brand">\n' + 
	                    	'<input type="checkbox" value="" class="m-checkable">\n<span></span>\n</label>'
	                }
	            },
	            { visible: false, targets: 1 }
		    ],
		    searching: false,
			lengthChange: false,
		    ordering: false,
		    paging: false,
		    info: false
		});
		
		table.on("change", ".m-group-checkable", function() {
            var e = $(this).closest("table").find("td:first-child .m-checkable"),
                a = $(this).is(":checked");
            $(e).each(function() {
                a ? ($(this).prop("checked", !0), $(this).closest("tr").addClass("active")) : ($(this).prop("checked", !1), $(this).closest("tr").removeClass("active"))
            })
        })
        
        table.on("change", "tbody tr .m-checkbox", function() {
            $(this).parents("tr").toggleClass("active");
        })
		
		return table;
	},
	singleCheck: function(id) {
		var table = $(id).DataTable({
			language: {
				emptyTable: "데이터가 없습니다."
			},
			columnDefs: [ 
				{
			        orderable: false,
			        className: 'select-checkbox',
			        targets: 0
				},
				{ visible: false, targets: 1 }
		    ],
		    select: {
		        style: 'os',
		        selector: 'td:first-child'
		    },
		    searching: false,
			lengthChange: false,
		    ordering: false,
		    paging: false,
		    info: false
		});
		
		return table;
	},
	rowsAdd: function(table, url, param) {
		table.clear().draw();
		
		$.ajax({
			url: url,
			type: "POST",
			data: JSON.stringify(param),
			contentType: "application/json",
			success: function(data) {
				table.rows.add(data).draw();
		   	}
		});
	},
	refresh: function(table, data) {
		table.clear().draw();
		table.rows.add(data).draw();
	}
}
