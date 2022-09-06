import type { NextPage } from 'next'
import Rive, {useRive} from "@rive-app/react-canvas";

const Home: NextPage = () => {

  const { rive, RiveComponent } = useRive({
    src: 'https://cdn.rive.app/animations/vehicles.riv',
    autoplay: false,
  });


  return (
    <div>
      <h1>Home</h1>
    </div>
  )
}

export default Home
