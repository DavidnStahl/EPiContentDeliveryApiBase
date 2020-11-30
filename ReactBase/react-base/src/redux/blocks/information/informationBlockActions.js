import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_INFORMATIONBLOCK_REQUEST,
    FETCH_INFORMATIONBLOCK_SUCCESS,
    FETCH_INFORMATIONBLOCK_FAILURE}
    from './informationBlockTypes'

export const fetchInformationBlockRequest = () => {
    return {
        type: FETCH_INFORMATIONBLOCK_REQUEST
    }
}

export const fetchInformationBlockSuccess = informationBlock => {
    return {
        type: FETCH_INFORMATIONBLOCK_SUCCESS,
        payload: informationBlock
    }
}

export const fetchInformationBlockFailure = error => {
    return {
        type: FETCH_INFORMATIONBLOCK_FAILURE,
        payload: error
    }
}

export const fetchInformationBlock  = () => {
    return async (dispatch) => {
        //const cache = getCache("InformationBlock")
        //if(cache === null){
            dispatch(fetchInformationBlockRequest)
            var informationBlock = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${12}`,{
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
            //saveDataToCache("InformationBlock", informationBlock)
            dispatch(fetchInformationBlockSuccess(informationBlock))
        //}
        //dispatch(fetchInformationBlock(cache))
    }       
}

            
                
