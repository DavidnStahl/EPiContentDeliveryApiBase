import {saveDataToCache,getCache} from '../../../cache/index'
import {
    FETCH_INSTRUCTIONBLOCK_REQUEST,
    FETCH_INSTRUCTIONBLOCK_SUCCESS,
    FETCH_INSTRUCTIONBLOCK_FAILURE}
    from './instructionBlockTypes'

export const fetchInstructionBlockRequest = () => {
    return {
        type: FETCH_INSTRUCTIONBLOCK_REQUEST
    }
}

export const fetchInstructionBlockSuccess = instructionBlock => {
    return {
        type: FETCH_INSTRUCTIONBLOCK_SUCCESS,
        payload: instructionBlock
    }
}

export const fetchInstructionBlockFailure = error => {
    return {
        type: FETCH_INSTRUCTIONBLOCK_FAILURE,
        payload: error
    }
}

export const fetchInstructionBlock  = () => {
    return async (dispatch) => {
        //const cache = getCache("InstructionBlock")
        //if(cache === null){       
            dispatch(fetchInstructionBlockRequest)
            var instructionBlock = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${15}`,{
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
            //saveDataToCache("InstructionBlock", instructionBlock)
            dispatch(fetchInstructionBlockSuccess(instructionBlock))
        //}
        //dispatch(fetchInstructionBlock(cache))        
    }                  
}