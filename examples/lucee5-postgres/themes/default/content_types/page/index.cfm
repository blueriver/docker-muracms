<cfoutput>
	<cfif !$.content().getIsHome()>

		<cfif !YesNoFormat($.event('muraMobileTemplate')) or (StructKeyExists(cookie, 'mobileFormat') and !cookie.mobileFormat)>
			<!--- Page Title --->
				<#$.getHeaderTag('headline')# class="mura-page-title pageTitle">
					#m.renderEditableAttribute(attribute='title')#
				</#$.getHeaderTag('headline')#>
			<!--- /Page Title --->
		</cfif>

		<!--- Release Date, Credits, etc. --->
		<cfset commentCount = Val($.content().getStats().getComments())>
		<cfset itCategories = $.content().getCategoriesIterator()>
		<cfif
			IsDate($.setDynamicContent($.content('releasedate')))
			or Len($.setDynamicContent($.content('credits')))
			or ListLen($.content().getTags())
			or itCategories.hasNext()
			or commentCount>
			<ul class="list-inline">

				<!--- Content Release Date --->
					<cfif IsDate($.setDynamicContent($.content('releasedate')))>
						<li class="list-inline-item">
							<i class="fa fa-clock-o" aria-hidden="true"></i> #LSDateFormat($.setDynamicContent($.content('releasedate')))#
						</span>
					</cfif>
				<!--- /Content Release Date --->

				<!--- Comments --->
					<cfif commentCount gt 0>
						<li class="list-inline-item">
							<i class="fa fa-comments" aria-hidden="true"></i> #commentCount# Comment<cfif commentCount gt 1>s</cfif>
						</li>
					</cfif>
				<!--- /Comments --->

				<!--- Tags --->
					<cfif ListLen($.content().getTags())>
						<li class="list-inline-item">
							<i class="fa fa-tags" aria-hidden="true"></i>
							<cfloop from="1" to="#ListLen($.content().getTags())#" index="t">
							#esapiEncode('html', trim(ListGetAt($.content().getTags(), t)))#<cfif t neq ListLen($.content().getTags())>, </cfif>
							</cfloop>
						</li>
					</cfif>
				<!--- /Tags --->

				<!--- Categories --->
					<cfif itCategories.hasNext()>
						<li class="list-inline-item">
							<i class="fa fa-folder-open" aria-hidden="true"></i>
							<cfloop condition="itCategories.hasNext()">
								<cfset categoryItem = itCategories.next()>
								#HTMLEditFormat(categoryItem.getName())#</a><cfif itCategories.hasNext()>, </cfif>
							</cfloop>
						</li>
					</cfif>
				<!--- /Categories --->

				<!--- Credits --->
					<cfif Len($.setDynamicContent($.content('credits')))>
						<li class="list-inline-item">
							<i class="fa fa-user" aria-hidden="true"></i> #esapiEncode('html', $.setDynamicContent($.content('credits')))#
						</li>
					</cfif>
				<!--- /Credits --->
			</ul>
		</cfif>

	</cfif>


	<!--- Primary Associated Image --->
		<cfif $.content().hasImage(usePlaceholder=false)>
			<cfscript>
				img = $.content().getImageURL(
					size = 'carouselimage' // small, medium, large, custom, or any other pre-defined image size
					,complete = false // set to true to include the entire URL, not just the absolute path (default)
				);
			</cfscript>
			<div class="mura-asset my-3">
				<a class="mura-meta-image-link" href="#$.content().getImageURL()#" title="#esapiEncode('html_attr', $.content('title'))#" rel="shadowbox[body]">
					<img class="mura-meta-image img-thumbnail img-responsive" src="#img#" alt="#esapiEncode('html_attr', $.content('title'))#">
				</a>
			</div>
		</cfif>
	<!--- /Primary Associated Image --->

	<!--- Body --->
		<div class="mura-body">
			#$.renderEditableAttribute(attribute="body",type="htmlEditor")#
		</div>
	<!--- /Body --->

</cfoutput>
