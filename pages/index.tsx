import type {NextPage} from "next";
import Rive, {useRive} from "@rive-app/react-canvas";

const Home: NextPage = () => {

  const {rive, RiveComponent} = useRive({
    src: "https://cdn.rive.app/animations/vehicles.riv",
    autoplay: false,
  });

  return (
    <div style={{ backgroundColor:"red"}}>
      {/*<Background/>*/}
      <h1>test</h1>
      {/*<RiveComponent*/}
      {/*  onMouseEnter={() => rive && rive.play()}*/}
      {/*  onMouseLeave={() => rive && rive.pause()}*/}
      {/*/>*/}
    </div>
  );
};

export default Home;
