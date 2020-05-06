//上传身份证
function setImagePreview(index) {
	console.log(1111)
		var index=index;
		// alert(index);
		var preview, img_txt, localImag, file_head = document.getElementById('imgInp'+index),
				picture = file_head.value;
		console.log(picture);
		if (!picture.match(/.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！"),
				!1;
		if (preview = document.getElementById("preview"+index), file_head.files && file_head.files[0]) preview.style.display = "block",
				preview.style.width = "100%",
				preview.style.height = "100%",
				preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);
		else {
			file_head.select(),
					file_head.blur(),
					img_txt = document.selection.createRange().text,
					localImag = document.getElementById("localImag"+index),
					localImag.style.width = "63px",
					localImag.style.height = "63px";
			try {
				localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",
						localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt
			} catch(f) {
				return alert("您上传的图片格式不正确，请重新选择！"),
						!1
			}
			preview.style.display = "none",
					document.selection.empty()
		}
//		subImg(index);

}

function lastStep () {
	window.location.href = "http://192.168.7.98:8080/htjr_glsz/mobile/apply/challengeRound/challenge/notice.jsp";
}