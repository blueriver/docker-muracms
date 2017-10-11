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
					<aside class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
						#$.dspObjects(1)#
					</aside>
					<div class="clearfix visible-xs"></div>
					<section class="col-lg-6 col-md-12 col-sm-12 col-xs-12 content">

						<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>

						#$.dspBody(
							body=$.content('body')
							, pageTitle=pageTitle
							, crumbList=false
							, showMetaImage=false
						)#
						#$.dspObjects(2)#
					</section>
					<aside class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
						#$.dspObjects(3)#
					</aside>
				</div><!--- /.row --->
			</div><!-- /.container -->
		</div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>
