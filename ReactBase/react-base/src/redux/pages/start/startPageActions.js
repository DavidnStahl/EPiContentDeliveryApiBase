import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_STARTPAGE_REQUEST,
    FETCH_STARTPAGE_SUCCESS,
    FETCH_STARTPAGE_FAILURE}
    from './startPageTypes'


export const fetchStartPageRequest = () => {
    return {
        type: FETCH_STARTPAGE_REQUEST
    }
}

export const fetchStartPageSuccess = (startPage,descriptionBlock,informationBlock) => {

    return {
        type: FETCH_STARTPAGE_SUCCESS,
        payload: startPage,
        informationBlock: informationBlock,
        descriptionBlock: descriptionBlock
    }
}

export const fetchStartPageFailure = error => {
    return {
        type: FETCH_STARTPAGE_FAILURE,
        payload: error
    }
}

export const fetchStartPage  = () => {
    //const cache = getCache("StartPage");
    //if(cache === null){
        return async (dispatch) => {
            dispatch(fetchStartPageRequest())  
            const data = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${5}`,{
                headers: {
                    'Accept-language': ''
                }
            })
            .then( response => {
                return response.json()
            })
            .then( json => {
                return json;
            })
            fetchBlockData(data,dispatch);
            //console.log(blockData);
            //saveDataToCache("StartPage",data);
            //dispatch(fetchStartPageSuccess(data,false))
        }
    //}
    //else{
        //return (dispatch) => {
            //dispatch(fetchStartPageSuccess(cache,false))
       // }
             
}

const fetchBlockData = async (json,dispatch)  => {
    var informationContentArea = json.informationContentArea
    var descriptionBlock = [];
    var informationBlock = [];
    

    informationContentArea.value.forEach(async element => {
        await fetch(`http://localhost:64473//api/episerver/v2.0/content/${element.contentLink.id}`,{
        headers: {
            'Accept-language': ''
        }
        })
        .then( response => {
            return response.json()
        })
        .then( json => {
            if(json.contentType[1] === "DescriptionBlock"){
               descriptionBlock.push(json);
            }
            if(json.contentType[1] === "InformationBlock"){
               informationBlock.push(json);
            }
            dispatch(fetchStartPageSuccess(json,descriptionBlock,informationBlock))
        })
    });
    

}






