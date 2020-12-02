import React, { useEffect} from 'react'
import { connect } from 'react-redux'
import { fetchInstructionPage} from '../../../redux'
import InstructionBlockContainer from '../../blocks/instruction/InstructionBlockContainer'

function InstructionPageContainer({instructionPageData, fetchInstructionPage}) {

    useEffect(() => {      
        fetchInstructionPage()     
     }, [])

     const instructionContentArea = instructionPageData.loading ? <h2>Loading</h2> : instructionPageData.error ? <h2>error</h2>  :
      instructionPageData.instructionContentArea !== false && instructionPageData.instructionPage !== false? instructionPageData.instructionContentArea.map(block => {
        if(block.contentType[1] === "InstructionBlock"){
            return <InstructionBlockContainer key={block.contentLink.id} data={block} className="mb-5"/>
        }
        return null}) : 
        <h2>loading</h2> 

    return (<div>{instructionContentArea}</div>)
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
