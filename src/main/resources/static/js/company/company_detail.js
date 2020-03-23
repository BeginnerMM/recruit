var href = window.location.href;
var page = 1;
var pageTotal = 5;
var box = new Vue({
    el: '#companyDetail_content',
    data: {
        company: [{}],
        companyname: "",
        companyaddress: "",
        description: '',
        corporatejuridicalperson: '',
        productpresentation: '',
        registeredassets: '',
        registrationtime: '',
        status:1

    },
    created: function () {
        this.initMethod();
    },
    methods: {
        initMethod: function () {
                $.ajax({
                    url: href + "?page=1",
                    type: "post",
                    dataType: "json",
                    success: function (msg) {
                        box.company = msg.list;
                        box.status = msg.status
                        console.log(msg);
                        $(msg.list).each(function (key, val) {
                            box.companyname = val.companyname;
                            box.companyaddress = val.companyaddress;
                            box.description = val.description;
                            box.corporatejuridicalperson = val.corporatejuridicalperson;
                            box.productpresentation = val.productpresentation;
                            box.registeredassets = val.registeredassets;
                            box.registrationtime = val.registrationtime;
                        });

                        if (msg.user != null) {
                            header.type = 'user';
                            header.person.user = msg.user;
                        }

                    },
                    error: function (msg) {
                        console.log(msg);
                    }
                });
        }
    }


});

$("#byCompany").click(function () {
    request(1)
    $(this).parent().addClass("active");
    $("#byJobs").parent().removeClass("active");
});

$("#byJobs").click(function () {
    request(2)
    $(this).parent().addClass("active");
    $("#byCompany").parent().removeClass("active");
});

function request(status) {
    $.ajax({
        url: href + "?page=1&status="+status,
        type: "post",
        dataType: "json",
        success: function (msg) {
            box.company = msg.list;
            box.status = msg.status
            console.log(msg);
            $(msg.list).each(function (key, val) {
                box.companyname = val.companyname;
                box.companyaddress = val.companyaddress;
                box.description = val.description;
                box.corporatejuridicalperson = val.corporatejuridicalperson;
                box.productpresentation = val.productpresentation;
                box.registeredassets = val.registeredassets;
                box.registrationtime = val.registrationtime;
            });

            if (msg.user != null) {
                header.type = 'user';
                header.person.user = msg.user;
            }

        },
        error: function (msg) {
            console.log(msg);
        }
    });
}

function nextPage() {
    page = page + 1;
    var status = 2;
    if (page <= pageTotal) {
        $.ajax({
            url:  href + "?page="+page+"&status="+status,
            type: "post",
            dataType: "json",
            success: function (msg) {
                box.company = msg.list;
                box.status = msg.status
                console.log(msg);
                $(msg.list).each(function (key, val) {
                    box.companyname = val.companyname;
                    box.companyaddress = val.companyaddress;
                    box.description = val.description;
                    box.corporatejuridicalperson = val.corporatejuridicalperson;
                    box.productpresentation = val.productpresentation;
                    box.registeredassets = val.registeredassets;
                    box.registrationtime = val.registrationtime;
                });

                if (msg.user != null) {
                    header.type = 'user';
                    header.person.user = msg.user;
                }

            }, error: function () {
                $("#viewMoreButton").empty();
                $("#viewMoreButton").append("没有更多");
            }
        });
    } else {
        $("#viewMoreButton").empty();
        $("#viewMoreButton").append("没有更多");
        $("#viewMoreButton").addClass("disable");
    }
}


