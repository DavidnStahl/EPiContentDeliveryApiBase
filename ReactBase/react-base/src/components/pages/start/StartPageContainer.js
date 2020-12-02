import React, { useEffect} from 'react'
import { connect } from 'react-redux'
import { fetchStartPage} from '../../../redux'
import DescriptionBlockContainer from '../../blocks/description/DescriptionBlockContainer'
import InformationBlockContainer from '../../blocks/information/InformationBlockContainer'

function StartPageContainer({startPageData, fetchStartPage}) {

    useEffect(() => {       
        fetchStartPage()
     }, [])

     const informationContentArea = startPageData.loading ? (<h2>Loading</h2>) : startPageData.error ? (<h2>error</h2> ) :
     startPageData.informationContentArea !== false? startPageData.informationContentArea.map(block => {
        if(block.contentType[1] === "InformationBlock"){
            return <InformationBlockContainer key={block.contentLink.id} data={block} className="mb-5"/>
        } else if(block.contentType[1] === "DescriptionBlock"){
            return  <DescriptionBlockContainer key={block.contentLink.id}  data={block} className="mb-5"/>
        }
        return null}) : 
        <h2>loading</h2>

    return (<div>{informationContentArea}</div>)
        
}

const mapStateToProps = state => {    
    return {
        startPageData: state.startPage
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchStartPage: () => dispatch(fetchStartPage())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (StartPageContainer)