<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}">
<head>
	<meta charset="utf-8">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
	<title>${msg("applicationName")}</title>
    <link rel="icon" type="image/png" href="${url.resourcesPath}/img/favicon.ico"/>
    <link type=text/css rel="stylesheet" href="${url.resourcesPath}/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css"/>
	<script type="text/javascript" src="${url.resourcesPath}/js/materialize.min.js"></script>
</head>

<body>
<div id="outer-wrapper">
    <div id="wrapper">

        <div class="row">
            <div class="col s10 m6 l4 offset-s1 offset-m3 offset-l4">
                <div class="row">
                    <div class="row mb-5">
                        <div class="col s12 center">
                            <div id="header-wrapper">
                                <a id="logo" href="https://www.driveterra.io/">
                                    <img src="data:image/png;base64,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">
                                </a>
                                <div class="left-align">
                                 <!--   <h5 id="header">${msg("applicationName")}</h5><br> -->
                                    <!-- <h5 id="header"><#nested "header"></h5><br> -->
                                   <!--  <p id="sub-header">${msg("applicationName")}</p> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                        <div class="col m12" id="kc-locale">
                            <div id="kc-locale-dropdown">
                                <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                <ul>
                                    <#list locale.supported as l>
                                        <li><a href="${l.url}">${l.label}</a></li>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                    </#if>

                    <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="section">
                            <div class="card-panel">
                                <#if message.type=='success' ><i class="material-icons green-text">check_circle</i><span
                                        class="green-text">${kcSanitize(message.summary)?no_esc}</span></#if>
                                <#if message.type=='warning' ><i class="material-icons orange-text">warning</i><span
                                        class="orange-text">${kcSanitize(message.summary)?no_esc}</span></#if>
                                <#if message.type=='error' ><i class="material-icons red-text">error</i><span
                                        class="red-text">${kcSanitize(message.summary)?no_esc}</span></#if>
                                <#if message.type=='info' ><i class="material-icons blue-text">info</i><span
                                        class="blue-text">${kcSanitize(message.summary)?no_esc}</span></#if>
                            </div>
                        </div>
                    </#if>

                    <div class="col s12">
                        <#nested "form">
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <#if displayInfo>
                            <#nested "info">
                        </#if>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
</#macro>
