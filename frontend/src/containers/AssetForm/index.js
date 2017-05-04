import React, { Component } from 'react';
import styled from 'styled-components';
import update from 'immutability-helper';
import { gql, graphql } from 'react-apollo';


const Button = styled.button`
  /* Adapt the colors based on primary prop */
  background: ${props => props.primary ? 'palevioletred' : 'white'};
  color: ${props => props.primary ? 'white' : 'palevioletred'};

  font-size: 1em;
  margin: 1em;
  padding: 0.25em 1em;
  border: 2px solid palevioletred;
  border-radius: 3px;
`;

class AssetForm extends Component {

  constructor(props) {
    super(props);

    this.state = {
      name: '',
      location: '',
    }
  }

  onClick = (e) => {
    e.preventDefault()
    this.props.createAsset(this.state.name, 'shams')
      .then(({ data }) => console.log('got data', data))
      .catch((error) => console.log('there was an error', error))
  }

  onChange = (e) => {
    this.setState({
      name: e.target.value,
    })
  }

  render() {

    return (
      <form>
        <label>Name</label>
        <input onChange={this.onChange.bind(this)}/>
        <Button onClick={this.onClick.bind(this)}>Click</Button>
      </form>
    )
  }
}


const SUBMIT_DATA_MUTATION = gql`
  mutation CreateAsset($name: String!, $location: String!) {
    create_asset(name: $name, location: $location)  {
      name
    }
  }
`
// const SUBMIT_DATA_MUTATION = gql`
//   mutation CreateAsset {
//     create_asset(name: "my object3", location: "my home")  {
//       name
//     }
//   }
// `

const AssetFormWithData = graphql(SUBMIT_DATA_MUTATION, {
  props: ({ ownProps, mutate }) => ({
    createAsset: (name, location) =>  mutate({
      variables: {name, location },
      updateQueries: {
        hello: (prev, { mutationResult }) => {
          const newAsset = mutationResult.data.create_asset;
          console.log(newAsset)
          return update(prev, {
            assets: {
              $unshift: [newAsset],
            }
          })
        }
      }
    })
  })
})(AssetForm);
export default AssetFormWithData
