import {
    FETCH_INFORMATIONBLOCK_REQUEST,
    FETCH_INFORMATIONBLOCK_SUCCESS,
    FETCH_INFORMATIONBLOCK_FAILURE}
    from './informationBlockTypes'

const initialState = {
    loading: false,
    informationBlock: false,
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_INFORMATIONBLOCK_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_INFORMATIONBLOCK_SUCCESS:
            return {
                loading: false,
                informationBlock: action.payload,
                error: ''
            }
        case FETCH_INFORMATIONBLOCK_FAILURE:
            return {
                loading: false,
                informationBlock: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer