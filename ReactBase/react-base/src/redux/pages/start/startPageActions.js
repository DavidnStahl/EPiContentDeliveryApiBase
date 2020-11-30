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

export const fetchStartPageSuccess = startPage => {
    return {
        type: FETCH_STARTPAGE_SUCCESS,
        payload: startPage
    }
}

export const fetchStartPageFailure = error => {
    return {
        type: FETCH_STARTPAGE_FAILURE,
        payload: error
    }
}

export const fetchStartPage  = () => {
    return async (dispatch) => {
        const cache = getCache("StartPage");
        if(cache === null){
            dispatch(fetchStartPageRequest)  
            const startPage = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${5}`,{
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
            saveDataToCache("StartPage",startPage);
            dispatch(fetchStartPageSuccess(startPage))
        }
        dispatch(fetchStartPageSuccess(cache))  
    }
          
}
