import { combineReducers } from 'redux'
import headerReducer from './blocks/header/headerReducer'
import footerReducer from './blocks/footer/footerReducer'
import startPageReducer from './pages/start/startPageReducer'
import instructionPageReducer from './pages/instruction/instructionPageReducer'

const rootReducer = combineReducers({
   header: headerReducer,
   footer: footerReducer,
   startPage: startPageReducer,
   instructionPage: instructionPageReducer,
})

export default rootReducer