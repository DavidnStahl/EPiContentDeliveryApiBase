import { combineReducers } from 'redux'
import headerReducer from './blocks/header/headerReducer'
import footerReducer from './blocks/footer/footerReducer'
import startPageReducer from './pages/start/startPageReducer'
import descriptionBlockReducer from './blocks/description/descriptionBlockReducer'
import instructionPageReducer from './pages/instruction/instructionPageReducer'
import instructionBlockReducer from './blocks/instruction/instructionBlockReducer'
import informationBlockReducer from './blocks/information/informationBlockReducer'

const rootReducer = combineReducers({
   header: headerReducer,
   footer: footerReducer,
   startPage: startPageReducer,
   descriptionBlock: descriptionBlockReducer,
   instructionPage: instructionPageReducer,
   instructionBlock: instructionBlockReducer,
   informationBlock: informationBlockReducer

})

export default rootReducer