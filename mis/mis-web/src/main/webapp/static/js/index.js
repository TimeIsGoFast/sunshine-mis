/**
 * Created by Administrator on 2017/6/6.
 */
var big_box=$(".images");
var width=big_box.width();
var img_box=$(".images .slider");
var btns=$(".images_btn .btn>li");
var index=1;
btns.each(function(n){
    $(this).click(function(){
        btns.removeClass("current");
        $(this).addClass("current");
        img_box.animate({"left":-width*(n+1)},500);
        index=n+1;
    })
});
function left(){
    if(!img_box.is(":animated")){
        if(index==1){
            index=5;
            img_box.animate({"left":0},500,function(){
                img_box.css({"left":-width*index});
            });
        }else{
            index--;
            img_box.animate({"left":-width*index},500);
        }
        btns.removeClass("current");
        btns.eq(index-1).addClass("current");
    }
}
function right(){
    if(!img_box.is(":animated")){
        if(index==5){
            index=1;
            img_box.animate({"left":-width*6},500,function(){
                img_box.css({"left":-width*index});
            });
        }else{
            index++;
            img_box.animate({"left":-width*index},500);
        }
        btns.removeClass("current");
        btns.eq(index-1).addClass("current");
    }
}
var timer = null;
//�Զ��ֲ�
//setInterval(fn,time)
//��ʾÿ��time�����ʱ��ִ��fn
//timer��ʾ��ʱ����id
function auto(){
    timer = setInterval(right,3000);
}
auto();

//��꾭��ֹͣ�ֲ�
big_box.mouseenter(function(){

    //ֹͣ��ʱ��
    clearInterval(timer);
}).mouseleave(function(){
    auto();

})

