import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchInstructionBlock} from '../../../redux'

function InstructionBlockContainer({instructionBlockData, fetchInstructionBlock}) {
    useEffect(() => {
        fetchInstructionBlock()           
     }, [])

    return instructionBlockData.loading ? (
        <h2>Loading</h2>
    ) : instructionBlockData.error ? (
       <h2>error</h2> 
    ) : instructionBlockData.instructionBlock !== false? (
        <div className="mt-3">     
           <h1>{instructionBlockData.instructionBlock.title.value}</h1>   
           <div dangerouslySetInnerHTML={{__html: instructionBlockData.instructionBlock.mainBody.value}}>
           </div>
        </div>) : (<h2>loading</h2>)
}

const mapStateToProps = state => {    
    return {
        instructionBlockData: state.instructionBlock
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchInstructionBlock: () => dispatch(fetchInstructionBlock())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (InstructionBlockContainer)