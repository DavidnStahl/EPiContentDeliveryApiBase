import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_FOOTER_REQUEST,
    FETCH_FOOTER_SUCCESS,
    FETCH_FOOTER_FAILURE}
    from './footerTypes'

export const fetchFooterRequest = () => {
    return {
        type: FETCH_FOOTER_REQUEST
    }
}

export const fetchFooterSuccess = footer => {
    return {
        type: FETCH_FOOTER_SUCCESS,
        payload: footer
    }
}

export const fetchFooterFailure = error => {
    return {
        type: FETCH_FOOTER_FAILURE,
        payload: error
    }
}

export const fetchFooter  = () => {
    return async (dispatch) => {
        //const cache = getCache("Footer");
        //if(cache === null){           
            dispatch(fetchFooterRequest)        
            var footer = await fetch('http://localhost:64473/api/footer')
            .then( response => {
                return response.json()
            })
            .then( json => {
                return json;
            })
            //saveDataToCache("Footer",footer)
            dispatch(fetchFooterSuccess(footer))           
        //}       
        //dispatch(fetchFooterSuccess(cache))
    }                                 
}