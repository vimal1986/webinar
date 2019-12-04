$(document).ready(function () {

    legaue = new Validation();
    /*leagueForm validation*/
    $("#leagueForm").on("submit", function(){
        //Code: Action (like ajax...)
        var leaguevalue = $("#league").val();
        if(!legaue.checkEmptyString(leaguevalue)){
            $(".error-msg ").html("please enter league name").show();
            return false;
        }
    });
    /*End leagueForm validation*/

    /*add_teamForm validation*/
    $("#addTeam").on("submit", function(event){
            event.preventDefault();
            var leagueValue=$("#team_league").val();
            var teamMember=$("#team_member").val();
            var teamRegion=$("#team_region").val();
            $("#addTeam").find(".error-msg").addClass("hide");
            var errorArray= [];
            if(!legaue.checkEmptyString(leagueValue)) {
                errorArray.push({"id": "#team_league","error": "Please select League"});
            }
            if(!legaue.checkEmptyString(teamMember)) {
                errorArray.push({"id": "#team_member","error": "Please Enter Team member"});
            }
            if(!legaue.checkEmptyString(teamRegion)) {
                errorArray.push({"id": "#team_region","error": "Please Enter Add Region"});
            }
            $("#team_league_id").closest(".error-msg");

            if(!errorArray.length){
                return;
            }
            for(var i=0; i<errorArray.length;i++){
                $(errorArray[i].id).parent().find(".error-msg").html(errorArray[i].error).removeClass("hide");
            }
            return false;
    });
    /*End add_teamForm validation*/

    $("#addDeal").on("submit", function() {
                var dealName=$("#name").val();
                var dealPrice=$("#price").val();
                var dealLeague=$("#dealLeague").val();
                var dealTeam=$("#dealTeam").val();
                $("#addTeam").find(".error-msg").addClass("hide");
                var errorArray= [];
                if(!legaue.checkEmptyString(dealName)) {
                    errorArray.push({"id": "#name","error": "Please Enter Name"});
                }
                if(!legaue.checkEmptyString(dealPrice)) {
                    errorArray.push({"id": "#price","error": "Please Enter Price"});
                }
                if(!legaue.checkEmptyString(dealLeague)) {
                    errorArray.push({"id": "#dealLeague","error": "Please Select League"});
                }
                if(!legaue.checkEmptyString(dealTeam)) {
                    errorArray.push({"id": "#dealTeam","error": "Please Select Team"});
                }
                if(!errorArray.length){
                    return;
                }
                for(var i=0; i<errorArray.length;i++){
                    $(errorArray[i].id).parent().find(".error-msg").html(errorArray[i].error).removeClass("hide");
                }
                return false;
    });

});