import React from 'react';
import { gql, graphql } from 'react-apollo';


const renderAsset = (asset) => {
  return (
    <li>{asset.name}</li>
  )
}
export const Assets = ({ data: { loading, assets, error } }) => {
  if (loading) return <div>Loading</div>
  if (error) return <div>ERROR</div>
  return (
    <div>
      <ul>
        {assets.map((asset) => renderAsset(asset))}
      </ul>
    </div>
  )
}

export const ASSETS_QUERY = gql`
  query {
    assets {
      name
    }
  }
`
export const withAsset = graphql(ASSETS_QUERY, { options: {
  variables: { name: "hello" }
}})

export default withAsset(Assets);
