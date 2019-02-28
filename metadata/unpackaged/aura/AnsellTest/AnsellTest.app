<!-- <aura:application >
	<prasadRevenueS:AnsellFirstComponent />
</aura:application> -->

<aura:application >

    <link href='/resource/prasadRevenueS__BSSF/bootstrap-sf1-0.1.0-beta.16/dist/css/bootstrap.css' rel="stylesheet"/>
    <ltng:require scripts="/resource/prasadRevenueS__Jquery224"  />
    
    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">Lightning Contacts</a>
            </div>
        </div>
    </div>

    <div class="container">
    <div class="row">
        <div class="col-sm-12">
            <c:AnsellFirstComponent />
        </div>
    </div>
</div>

</aura:application>