var page = 1;
var pageTotal = 4;
var box = new Vue({
    el: '#job-content',
    data: {
        jobs: [{}]
    },
    mounted: function () {
        this.$nextTick(function () {
            $.ajax({
                url: "/page/" + page,
                type: "post",
                dataType: "json",
                success: function (msg) {
                    box.jobs = msg.posInfo;

                    if (msg.user != null) {
                        headervue.type = 'user';
                        headervue.person.user = msg.user;
                    }
                },
                error: function (msg) {
                    window.location.href = "/user/login";
                }
            });

        });
    }
});

function nextPage() {
    page = page + 1;
    if (page <= pageTotal) {
        $.ajax({
            url: "/page/" + page,
            type: "post",
            dataType: "json",
            success: function (msg) {
                for (var i = 0; i < msg.posInfo.length; i++) {
                    box.jobs.push(msg.posInfo[i]);
                }
                // box.jobs.push(msg.posInfo);
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

