import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_INSTRUCTIONPAGE_REQUEST,
    FETCH_INSTRUCTIONPAGE_SUCCESS,
    FETCH_INSTRUCTIONPAGE_FAILURE}
    from './instructionPageTypes'


export const fetchInstructionPageRequest = () => {
    return {
        type: FETCH_INSTRUCTIONPAGE_REQUEST
    }
}

export const fetchInstructionPageSuccess = instructionPage => {
    return {
        type: FETCH_INSTRUCTIONPAGE_SUCCESS,
        payload: instructionPage
    }
}

export const fetchInstructionPageFailure = error => {
    return {
        type: FETCH_INSTRUCTIONPAGE_FAILURE,
        payload: error
    }
}

export const fetchInstructionPage  = () => {
    return async (dispatch) => {
        //const cache = getCache("InstructionPage");
        //if(cache === null){
            dispatch(fetchInstructionPageRequest)
            const instructionPage = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${9}`,{
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
            //saveDataToCache("InstructionPage",instructionPage)
            dispatch(fetchInstructionPageSuccess(instructionPage))
        //}
        //dispatch(fetchInstructionPageSuccess(cache))                
    }
          
}
