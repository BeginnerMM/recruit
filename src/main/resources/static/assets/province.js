// var defaults = {
//     s1: 'provid',
//     s2: 'cityid',
//     s3: 'areaid',
//     v1: null,
//     v2: null,
//     v3: null
// };
// var $form;
// var form;
// var $;
// layui.define(['jquery', 'form'], function () {
//     $ = layui.jquery;
//     form = layui.form;
//     $form = $('form');
//     treeSelect(defaults);
// });
// function treeSelect(config) {
//     config.v1 = config.v1 ? config.v1 : 110000;
//     config.v2 = config.v2 ? config.v2 : 110100;
//     config.v3 = config.v3 ? config.v3 : 110101;
//     $.each(threeSelectData, function (k, v) {
//         appendOptionTo($form.find('select[name=' + config.s1 + ']'), k, v.val, config.v1);
//     });
//     form.render();
//     cityEvent(config);
//     areaEvent(config);
//     form.on('select(' + config.s1 + ')', function (data) {
//         cityEvent(data);
//         form.on('select(' + config.s2 + ')', function (data) {
//             areaEvent(data);
//         });
//     });
//
//     function cityEvent(data) {
//         $form.find('select[name=' + config.s2 + ']').html("");
//         config.v1 = data.value ? data.value : config.v1;
//         $.each(threeSelectData, function (k, v) {
//             if (v.val == config.v1) {
//                 if (v.items) {
//                     $.each(v.items, function (kt, vt) {
//                         appendOptionTo($form.find('select[name=' + config.s2 + ']'), kt, vt.val, config.v2);
//                     });
//                 }
//             }
//         });
//         form.render();
//         config.v2 = $('select[name=' + config.s2 + ']').val();
//         areaEvent(config);
//     }
//     function areaEvent(data) {
//         $form.find('select[name=' + config.s3 + ']').html("");
//         config.v2 = data.value ? data.value : config.v2;
//         $.each(threeSelectData, function (k, v) {
//             if (v.val == config.v1) {
//                 if (v.items) {
//                     $.each(v.items, function (kt, vt) {
//                         if (vt.val == config.v2) {
//                             $.each(vt.items, function (ka, va) {
//                                 appendOptionTo($form.find('select[name=' + config.s3 + ']'), ka, va, config.v3);
//                             });
//                         }
//                     });
//                 }
//             }
//         });
//         form.render();
//         form.on('select(' + config.s3 + ')', function (data) { });
//     }
//     function appendOptionTo($o, k, v, d) {
//         var $opt = $("<option>").text(k).val(v);
//         if (v == d) { $opt.attr("selected", "selected") }
//         $opt.appendTo($o);
//     }
//
// }
//

var areaData = Area;
var $form;
var form;
var $;
layui.use(['jquery', 'form'], function() {
    $ = layui.jquery;
    form = layui.form;
    $form = $('form');
    loadProvince();
});
//加载省数据   '_' + areaData[i].mallCityList.length + '_' + i +
function loadProvince() {
    var proHtml = '';
    for (var i = 0; i < areaData.length; i++) {
        proHtml += '<option value="' + areaData[i].provinceCode + '_' + areaData[i].mallCityList.length + '_' + i +'">' + areaData[i].provinceName + '</option>';
    }
    //初始化省数据
    $form.find('select[name=province]').append(proHtml);
    form.render();
    form.on('select(province)', function(data) {
        $form.find('select[name=area]').html('<option value="">请选择县/区</option>').parent().hide();
        var value = data.value;
        var d = value.split('_');
        var code = d[0];
        var count = d[1];
        var index = d[2];
        if (count > 0) {
            loadCity(areaData[index].mallCityList);
        } else {
            $form.find('select[name=city]').parent().hide();
        }
    });
}
//加载市数据   '_' + citys[i].mallAreaList.length + '_' + i +
function loadCity(citys) {
    var cityHtml = '';
    for (var i = 0; i < citys.length; i++) {
        cityHtml += '<option value="' + citys[i].cityCode +'">' + citys[i].cityName + '</option>';
    }
    $form.find('select[name=city]').html(cityHtml).parent().show();
    form.render();
    form.on('select(city)', function(data) {
        var value = data.value;
        var d = value.split('_');
        var code = d[0];
        var count = d[1];
        var index = d[2];
        if (count > 0) {
            loadArea(citys[index].mallAreaList);
        } else {
            $form.find('select[name=area]').parent().hide();

        }
    });
}
//加载县/区数据
function loadArea(areas) {
    var areaHtml = '';
    for (var i = 0; i < areas.length; i++) {
        areaHtml += '<option value="' + areas[i].areaCode + '">' + areas[i].areaName + '</option>';
    }
    $form.find('select[name=area]').html(areaHtml).parent().show();
    form.render();
    form.on('select(area)', function(data) {
    });
}

