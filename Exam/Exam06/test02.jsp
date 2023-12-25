<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript">
          var ns4=document.layers
          var ie4=document.all
          var ns6=document.getElementById&&!document.all

          var dragswitch=0
          var nsx
          var nsy
          var nstemp

          function drag_dropns(name){
           if (!ns4)
           return
           temp=eval(name)
           temp.captureEvents(Event.MOUSEDOWN | Event.MOUSEUP)
           temp.onmousedown=gons
           temp.onmousemove=dragns
           temp.onmouseup=stopns
          }

          function gons(e){
          temp.captureEvents(Event.MOUSEMOVE)
           nsx=e.x
           nsy=e.y
          }

      function dragns(e){
       if (dragswitch==1){
        temp.moveBy(e.x-nsx,e.y-nsy)
        return false
       }
      }

      function stopns(){
       temp.releaseEvents(Event.MOUSEMOVE)
      }

      function drag_drop(e){
       if (ie4&&dragapproved){
        crossobj.style.left=tempx+event.clientX-offsetx
        crossobj.style.top=tempy+event.clientY-offsety
        return false
       }
       else if (ns6&&dragapproved){
        crossobj.style.left=tempx+e.clientX-offsetx+"px"
        crossobj.style.top=tempy+e.clientY-offsety+"px"
        return false
       }
      }

      function initializedrag(e){
       crossobj=ns6? document.getElementById("showimage") : document.all.showimage
       var firedobj=ns6? e.target : event.srcElement
       var topelement=ns6? "html" : document.compatMode && document.compatMode!="BackCompat"? "documentElement" : "body"

       while (firedobj.tagName!=topelement.toUpperCase() && firedobj.id!="dragbar"){
        firedobj=ns6? firedobj.parentNode : firedobj.parentElement
       }

       if (firedobj.id=="dragbar"){
        offsetx=ie4? event.clientX : e.clientX
        offsety=ie4? event.clientY : e.clientY

        tempx=parseInt(crossobj.style.left)
        tempy=parseInt(crossobj.style.top)

        dragapproved=true
        document.onmousemove=drag_drop
       }
      }
      document.onmouseup=new Function("dragapproved=false")

      function hidebox(){
       crossobj=ns6? document.getElementById("showimage") : document.all.showimage
       if (ie4||ns6)
       crossobj.style.visibility="hidden"
       else if (ns4)
       document.showimage.visibility="hide"
      }
  </script>
</head>
<body>
   <div id="showimage" style="position:absolute;width:250px;left:250px;top:250px">
       <!--  위 태그에서 위치를 지정해 줄 수 있습니다  --->
       <table border="0" width="250" bgcolor="orange" cellspacing="0" cellpadding="2">
          <tr>
              <td width="100%">
                  <table border="0" width="100%" cellspacing="0" cellpadding="0" height="36px">
                     <tr>
                        <td id="dragbar" style="cursor:hand; cursor:pointer" width="100%" onMousedown="initializedrag(event)">
                           <ilayer width="100%" onSelectStart="return false">
                             <layer width="100%" onMouseover="dragswitch=1;if (ns4) drag_dropns(showimage)" onMouseout="dragswitch=0"><font face="Verdana" color="#FFFFFF">
                                <strong><small>공지사항</small></strong></font>
                             </layer>
                          </ilayer>
                       </td>
                       <td style="cursor:hand" nowrap>
                            <a href="#" onClick="hidebox();return false">닫기</a>
                       </td>
                    </tr>
                    <tr height=200>
                       <td width="100%" bgcolor="#FFFFFF" style="padding:4px" colspan="2">
                              이곳에 공지할 내용을 넣습니다<br>
                              물론 이미지도 가능합니다
                       </td>
                    </tr>
                 </table>
              </td>
          </tr>
       </table>
       </div>
</body>
</html>