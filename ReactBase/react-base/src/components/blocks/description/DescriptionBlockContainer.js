import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchDescriptionBlock} from '../../../redux'

function DescriptionBlockContainer({descriptionBlockData, fetchDescriptionBlock}) {
    useEffect(() => {
        fetchDescriptionBlock()           
     }, [])

    return descriptionBlockData.loading ? (
        <h2>Loading</h2>
    ) : descriptionBlockData.error ? (
       <h2>error</h2> 
    ) : descriptionBlockData.descriptionBlock !== false? (
        <div className="mt-3">     
           <h1>{descriptionBlockData.descriptionBlock.title.value}</h1>   
           <div dangerouslySetInnerHTML={{__html: descriptionBlockData.descriptionBlock.mainBody.value}}>
           </div>
        </div>) : (<h2>loading</h2>)
}

const mapStateToProps = state => {    
    return {
        descriptionBlockData: state.descriptionBlock
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchDescriptionBlock: () => dispatch(fetchDescriptionBlock())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (DescriptionBlockContainer)
