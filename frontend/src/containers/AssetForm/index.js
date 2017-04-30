import React, { Component } from 'react';
import styled from 'styled-components';
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
  onClick = (e) => {
    e.preventDefault()
    console.log('test')
    this.props.mutate()
      .then(({ data }) => console.log('got data', data))
      .catch((error) => console.log('there was an error', error))
  }
  render() {

    return (
      <form>
        <label>Name</label>
        <input />
        <Button onClick={this.onClick.bind(this)} />
      </form>
    )
  }
}


const createAsset = gql`
  mutation CreateAsset {
    create_asset(name: "my object", location: "my home")  {
      name
    }
  }
`

const AssetFormWithData = graphql(createAsset)(AssetForm);
export default AssetFormWithData
