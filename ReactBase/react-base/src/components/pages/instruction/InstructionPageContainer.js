import React, { useEffect} from 'react'
import { connect } from 'react-redux'
import { fetchInstructionPage} from '../../../redux'
import InstructionBlockContainer from '../../blocks/instruction/InstructionBlockContainer'

function InstructionPageContainer({instructionPageData, fetchInstructionPage}) {

    useEffect(() => {        
        fetchInstructionPage()      
     }, [])

    return instructionPageData.loading ? (
        <h2>Loading</h2>
    ) : instructionPageData.error ? (
       <h2>error</h2> 
    ) : instructionPageData.instructionPage !== false ?( <div>
          <InstructionBlockContainer/>
         </div> ) : <h2>loading</h2>
}

const mapStateToProps = state => {    
    return {
        instructionPageData: state.instructionPage
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchInstructionPage: () => dispatch(fetchInstructionPage())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (InstructionPageContainer)
