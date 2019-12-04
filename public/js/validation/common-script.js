//main object
var Validation=function() {

}

// checkEmptyString
Validation.prototype.checkEmptyString = function(string) {
    var response = true;
    if(!string){
        response = false;
    }
    return response;
};

// checkMaxMinString
Validation.prototype.checkMaxMinString = function(min,max,string) {
    if(!(min <= string.length <= max))
        return false;
};
// trim function
Validation.prototype.getTrimString = function(string) {
    return string.trim();
};

/*fileFileExist*/
Validation.prototype.fileFileExist= function (fileObject) {
    //file not exist
    if (fileObject.files.length == 0) {
        return false;
    }
};

/*checkAllow file Extension*/
Validation.prototype.FileExtention= function(currentObject) {
    var fileExtension = ['jpeg', 'jpg', 'pdf'];
    if ($.inArray($(currentObject).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
        return false;
    }
};

//show function
Validation.prototype.showError= function () {

};