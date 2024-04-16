import axios from "axios";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";

const ViewPost = () => {
  const { id } = useParams();
  const [post, setPost] = useState({});
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchPost = async () => {
      setLoading(true);
      try {
        axios
          .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/blog/${id}`)
          .then((res) => {
            setPost(res.data);
          })
          .catch((error) => {
            console.log(error);
          })
          .finally(() => setLoading(false));
      } catch (error) {
        console.log(error);
        setLoading(false);
      }
    };
    fetchPost();
  }, [id]);
  console.log(post);
  return (
    <div className="my-5 px-5">
      {loading ? (
        <p>Loading...</p>
      ) : (
        <div>
          <h1 className="text-3xl font-bold">{post?.postTitle}</h1>
          <div className="flex gap-x-3 text-gray-500">
            <p>{new Date(post?.createdAt).toDateString()}</p>
            <p>{post?.author?.name}</p>
          </div>
          <div className="h-[400px]">
            <img
              className="h-full my-5"
              src={`${import.meta.env.VITE_APP_PUBLIC_SERVER}/images/${post?.bannerImg}`}
              alt={post?.postTitle}
              crossOrigin="anonymous"
            />
          </div>
          <div
            dangerouslySetInnerHTML={{
              __html: post?.content,
            }}
          />
        </div>
      )}
    </div>
  );
};

export default ViewPost;
