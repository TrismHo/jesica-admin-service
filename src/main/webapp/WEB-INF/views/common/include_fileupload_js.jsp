<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js" ></script>
<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js" ></script>
<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js" ></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js" ></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js" ></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js" ></script>

<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js" ></script>
<![endif]-->

<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
		{% for (var i=0, file; file=o.files[i]; i++) { %}
		<tr class="template-upload fade show" data-id="t-upload">
			<td width="40%">
				<span class="preview"></span>
			</td>
			<td width="60%">
				<div class="bg-light rounded p-10 mb-2">
					<dl class="m-b-0">
						<dt class="text-inverse">File Name:</dt>
						<dd class="name">{%=file.name%}</dd>
						<dt class="text-inverse m-t-10">File Size:</dt>
						<dd class="size">Processing...</dd>
					</dl>
					<%--<dl>
						<dt class="text-inverse m-t-3">Progress:</dt>
						<dd class="m-t-5">
							<div class="progress progress-sm progress-striped active rounded-corner"><div class="progress-bar progress-bar-primary" style="width:0%; min-width: 40px;">0%</div></div>
						</dd>
					</dl>--%>
				<%--	{% if (!i && !o.options.autoUpload) { %}
					<button class="btn btn-primary start width-100 p-r-20 m-r-3" disabled>
						<i class="fa fa-upload fa-fw text-inverse"></i>
						<span>Start</span>
					</button>
					{% } %}--%>
					{% if (!i) { %}
						<button type="reset" class="btn btn-success cancel width-100 p-r-20">
							<i class="fa fa-trash fa-fw text-muted"></i>
							<span>Cancel</span>
						</button>
					{% } %}
				</div>
				<strong class="error text-danger h-auto d-block text-left"></strong>
			</td>
		</tr>
		{% } %}
	</script>

<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
		{% for (var i=0, file; file=o.files[i]; i++) { %}
			<tr class="template-download fade show" data-id="t-download">
				<td width="1%">
					<span class="preview">
						{% if (file.thumbnailUrl) { %}
							<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}" class="rounded"></a>
						{% } else { %}
							<div class="bg-light text-center f-s-20" style="width: 80px; height: 80px; line-height: 80px; border-radius: 6px;">
								<i class="fa fa-file-image fa-lg text-muted"></i>
							</div>
						{% } %}
					</span>
				</td>
				<td>
					<div class="bg-light p-10 mb-2">
						<dl class="m-b-0">
							<dt class="text-inverse">File Name:</dt>
							<dd class="name">
								{% if (file.url) { %}
									<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
								{% } else { %}
									<span>{%=file.name%}</span>
								{% } %}
							</dd>
							<dt class="text-inverse m-t-10">File Size:</dt>
							<dd class="size">{%=o.formatFileSize(file.size)%}</dd>
						</dl>
						{% if (file.error) { %}
							<div><span class="label label-danger">ERROR</span> {%=file.error%}</div>
						{% } %}
					</div>
				</td>
				<td></td>
				<td>
					{% if (file.deleteUrl) { %}
						<button class="btn btn-danger delete width-100 m-r-3 p-r-20" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
							<i class="fa fa-trash pull-left fa-fw text-inverse m-t-2"></i>
							<span>Delete</span>
						</button>
						<input type="checkbox" name="delete" value="1" class="toggle">
					{% } else { %}
						<button class="btn btn-default cancel width-100 m-r-3 p-r-20">
							<i class="fa fa-trash pull-left fa-fw text-muted m-t-2"></i>
							<span>Cancel</span>
						</button>
					{% } %}
				</td>
			</tr>
		{% } %}

	</script>



<script>

	let originalFiles = null;
	let handleJqueryFileUpload = function() {


		// Initialize the jQuery File Upload widget:
		$('#fileupload').fileupload({
			autoUpload: false,
			disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent),
			maxFileSize: 5000000000,
			// acceptFileTypes: /(\.|\/)(gif|jpe?g|png|bmp|mp4|avi|flv|mkv|wmv|mov|xls|xlsx)$/i,
			acceptFileTypes: /(\.|\/)(gif|jpg|png|bmp|mp4|avi|flv|mkv|wmv|mov|xls|xlsx)$/i,
			// Uncomment the following to send cross-domain cookies:
			//xhrFields: {withCCOLOR_REDentials: true},
			previewMaxWidth: 300,
			previewMaxHeight: 200,
		});

		// Enable iframe cross-domain access via COLOR_REDirect option:
		$('#fileupload').fileupload(
				'option',
				'COLOR_REDirect',
				window.location.href.replace(
						/\/[^\/]*$/,
						'/cors/result.html?%s'
				)
		);

		// Upload server status check for browsers with CORS support:
		if ($.support.cors) {
			$.ajax({
				type: 'HEAD'
			}).fail(function () {
				$('<div class="alert alert-danger"/>').text('Upload server currently unavailable - ' + new Date()).appendTo('#fileupload');
			});
		}
		// hide empty row text
		$('#fileupload').bind('fileuploadadd', function(e, data) {
			$('#fileupload [data-id="empty"]').hide();
			originalFiles = data.originalFiles;
		});

		// show empty row text
		$('#fileupload').bind('fileuploadfail', function(e, data) {
			var rowLeft = (data['originalFiles']) ? data['originalFiles'].length : 0;
			if (data.errorThrown === "abort") {
				$('#fileupload [data-id="empty"]').show();
			}
		});

		// Load & display existing files:
		$('#fileupload').addClass('fileupload-processing');

		$.ajax({
			// Uncomment the following to send cross-domain cookies:
			//xhrFields: {withCCOLOR_REDentials: true},
			url: $('#fileupload').fileupload('option', 'url'),
			dataType: 'json',
			context: $('#fileupload')[0]
		}).always(function () {
			$(this).removeClass('fileupload-processing');
		}).done(function (result) {

			$(this).fileupload('option', 'done')
					.call(this, $.Event('done'), {result: result});
		});

		return {
			fileSize: function() {
				return originalFiles.length;
			},
			getFiles: function() {
				return originalFiles;
			}
		}

	};

	let removeFromFileUpload = function() {
		$('#fileupload [data-id="empty"]').show();
		$('#fileupload [data-id="t-upload"]').empty();
		$('#fileupload [data-id="t-download"]').empty();
	};

	let previewMedia = function(url, mimeType, _modal) {

		let html;
		if (mimeType.indexOf('video') > -1) {
			html = '<video width="auto" height="240" class="ad-video" controls preload="auto" style="margin-left: auto; margin-right: auto; display: block;">\n' +
					'<source src="'+ url +'" type="' + unEscapeHtml(mimeType) + '"></video>';
		} else if (mimeType.indexOf('image') > -1) {
			html = '<img width="auto" height="240" class="ad-image" src="'+ url+'" alt="preview" style="margin-left: auto; margin-right: auto; display: block;"/>';
		} else {

		}
		_modal.find('.preview').html(html);
	};
	let FormMultipleUpload = function () {
		"use strict";
		return {
			//main function
			init: function () {
				handleJqueryFileUpload();
			},
			remove: function() {
				removeFromFileUpload();
			},
			fileLength: function () {

				return originalFiles !== null ? originalFiles.length : 0;
			},
			getFile: function () {
				return originalFiles[0];
			},
			preview: function(url, mimeType, _modal) {
				return previewMedia(url, mimeType, _modal);
			},
		};
	}();
	FormMultipleUpload.init();


</script>