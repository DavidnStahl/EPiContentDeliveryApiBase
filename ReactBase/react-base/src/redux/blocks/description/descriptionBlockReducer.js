import {
    FETCH_DESCRIPTIONBLOCK_REQUEST,
    FETCH_DESCRIPTIONBLOCK_SUCCESS,
    FETCH_DESCRIPTIONBLOCK_FAILURE}
    from './descriptionBlockTypes'

const initialState = {
    loading: false,
    descriptionBlock: false,
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_DESCRIPTIONBLOCK_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_DESCRIPTIONBLOCK_SUCCESS:
            return {
                loading: false,
                descriptionBlock: action.payload,
                error: ''
            }
        case FETCH_DESCRIPTIONBLOCK_FAILURE:
            return {
                loading: false,
                descriptionBlock: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer