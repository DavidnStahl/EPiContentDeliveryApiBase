import {
    FETCH_INSTRUCTIONBLOCK_REQUEST,
    FETCH_INSTRUCTIONBLOCK_SUCCESS,
    FETCH_INSTRUCTIONBLOCK_FAILURE}
    from './instructionBlockTypes'

const initialState = {
    loading: false,
    instructionBlock: false,
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_INSTRUCTIONBLOCK_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_INSTRUCTIONBLOCK_SUCCESS:
            return {
                loading: false,
                instructionBlock: action.payload,
                error: ''
            }
        case FETCH_INSTRUCTIONBLOCK_FAILURE:
            return {
                loading: false,
                instructionBlock: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer