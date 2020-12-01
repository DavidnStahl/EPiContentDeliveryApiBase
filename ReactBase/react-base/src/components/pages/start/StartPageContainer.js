import React, { useEffect} from 'react'
import { connect } from 'react-redux'
import { fetchStartPage} from '../../../redux'
import DescriptionBlockContainer from '../../blocks/description/DescriptionBlockContainer'
import InformationBlockContainer from '../../blocks/information/InformationBlockContainer'

function StartPageContainer({startPageData, fetchStartPage}) {


    useEffect(() => {       
        fetchStartPage()
     }, [])


    return startPageData.loading ? (
        <h2>Loading</h2>
    ) : startPageData.error ? (
       <h2>error</h2> 
    ) : startPageData.informationBlock !== false?( <div>
          <InformationBlockContainer data={startPageData.informationBlock[0]} className="mb-5"/>
          <DescriptionBlockContainer key={1}  data={startPageData.descriptionBlock[0]} className="mb-5"/>
          <DescriptionBlockContainer  key={2} data={startPageData.descriptionBlock[1]} className="mb-5"/>
          <DescriptionBlockContainer  key={3} data={startPageData.descriptionBlock[2]} className="mb-5"/>
         </div> ) : <h2>loading</h2>
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