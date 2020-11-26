import React, { useEffect } from 'react'
import { useSelector, useDispatch } from 'react-redux'
import headBlock from '../actions/headBlock'

function EpiserverHeaderBlockComponent() {
    const headerModel = useSelector(state => state.headerModel);
    const disPatch = useDispatch();   

    return (
        <div>
            <button onClick={() => disPatch(headBlock())}>GetHeader</button>
            <h1>{headerModel}</h1>
        </div>
    )
}

export default EpiserverHeaderBlockComponent
