import React, { useEffect} from 'react'
import { connect } from 'react-redux'
import { fetchStartPage} from '../../../redux'
import DescriptionBlockContainer from '../../blocks/description/DescriptionBlockContainer'

function StartPageContainer({startPageData, fetchStartPage}) {

    useEffect(() => {        
        fetchStartPage()      
     }, [])


    return startPageData.loading ? (
        <h2>Loading</h2>
    ) : startPageData.error ? (
       <h2>error</h2> 
    ) : startPageData.startPage !== false ?( <div className="text-black-50">
          <DescriptionBlockContainer/>
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