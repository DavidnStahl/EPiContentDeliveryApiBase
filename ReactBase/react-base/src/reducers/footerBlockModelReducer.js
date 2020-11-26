const episerverDomainName = 'http://localhost:64473/';


const footerBlockModelReducer = (state = "", action) => {
    if(action.type === "ja"){
       return "ja";
    }
    else{
        return "";
    }
}


export default footerBlockModelReducer