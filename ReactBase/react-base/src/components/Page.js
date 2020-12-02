import React from 'react';
import {Switch, Route} from 'react-router-dom';
import StartPageContainer from './pages/start/StartPageContainer'
import InstructionPageContainer from './pages/instruction/InstructionPageContainer'

const Page = (() => {
    return (
        <Switch>
            <Route exact path='/' component={StartPageContainer}></Route>
            <Route path='/Start' component={StartPageContainer}></Route>
            <Route path='/Instructions' component={InstructionPageContainer}></Route>
        </Switch>
    )
})

export default Page