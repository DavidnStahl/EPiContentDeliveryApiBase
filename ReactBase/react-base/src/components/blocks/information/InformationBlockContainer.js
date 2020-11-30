import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchInformationBlock} from '../../../redux'

function InformationBlockContainer({informationBlockData, fetchInformationBlock}) {
    useEffect(() => {
        fetchInformationBlock()           
     }, [])

    return informationBlockData.loading ? (
        <h2>Loading</h2>
    ) : informationBlockData.error ? (
       <h2>error</h2> 
    ) : informationBlockData.informationBlock !== false? (
        <div className="mt-3">     
           <h1>{informationBlockData.informationBlock.title.value}</h1>   
           <div dangerouslySetInnerHTML={{__html: informationBlockData.informationBlock.mainBody.value}}>
           </div>
        </div>) : (<h2>loading</h2>)
}

const mapStateToProps = state => {    
    return {
        informationBlockData: state.informationBlock
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchInformationBlock: () => dispatch(fetchInformationBlock())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (InformationBlockContainer)