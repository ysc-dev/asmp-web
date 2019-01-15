var createTable = {
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
	}
}
