import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_DESCRIPTIONBLOCK_REQUEST,
    FETCH_DESCRIPTIONBLOCK_SUCCESS,
    FETCH_DESCRIPTIONBLOCK_FAILURE}
    from './descriptionBlockTypes'

export const fetchDescriptionBlockRequest = () => {
    return {
        type: FETCH_DESCRIPTIONBLOCK_REQUEST
    }
}

export const fetchDescriptionBlockSuccess = descriptionBlock => {
    return {
        type: FETCH_DESCRIPTIONBLOCK_SUCCESS,
        payload: descriptionBlock
    }
}

export const fetchDescriptionBlockFailure = error => {
    return {
        type: FETCH_DESCRIPTIONBLOCK_FAILURE,
        payload: error
    }
}

export const fetchDescriptionBlock  = () => {
    return async (dispatch) => {
        //const cache = getCache("DescriptionBlock")
        //if(cache === null){
            dispatch(fetchDescriptionBlockRequest)
            var descriptionBlock = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${13}`,{
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
            //saveDataToCache("DescriptionBlock",descriptionBlock)
            dispatch(fetchDescriptionBlockSuccess(descriptionBlock))
        //}
        //dispatch(fetchDescriptionBlockSuccess(cache))
    }            
}