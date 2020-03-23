var href = window.location.href;
var page = 1;
var box = new Vue({
    el: '#news_detail_content',
    data: {
        news: "",

    },
    created: function () {
        this.initMethod();
    },
    methods: {
        initMethod: function () {
            $.ajax({
                url: href,
                type: "post",
                dataType: "json",
                success: function (msg) {
                    box.news = msg.newsDetailBo
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


