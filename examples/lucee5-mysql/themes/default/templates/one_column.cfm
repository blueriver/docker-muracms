<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<div class="template py-5">
			<div class="container">
				<cfinclude template="inc/breadcrumb.cfm" />
				<div class="row">
					<section class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
						#$.dspBody(body=$.content('body')
							, pageTitle=pageTitle
							, crumbList=false
							, showMetaImage=false
						)#
						#$.dspObjects(2)#
					</section>
				</div>
			</div><!-- /.container -->
		</div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>
