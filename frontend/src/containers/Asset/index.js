import React from 'react';
import { gql, graphql } from 'react-apollo';


const renderAsset = (asset, index) => {
  return (
    <li key={index}>{asset.name}</li>
  )
}
export const Assets = ({ data: { loading, assets, error } }) => {
  if (loading) return <div>Loading</div>;
  if (error) return <div>ERROR</div>;
  console.log(assets)
  return (
    <div>
      <ul>
        {assets.map((asset, index) => renderAsset(asset)).sort()}
      </ul>
    </div>
  )
}

export const ASSETS_QUERY = gql`
  query hello{
    assets {
      name
    }
  }
`
export const withAsset = graphql(ASSETS_QUERY, { options: {
  variables: { name: "hello" }
}})

export default withAsset(Assets);
