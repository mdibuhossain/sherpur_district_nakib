import { useState } from 'react'
import Home from './pages/Home'
import AddDistrictInfo from './pages/dashboard/AddDistrictInfo'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      {/* <Home /> */}
      <AddDistrictInfo />
    </>
  )
}

export default App
