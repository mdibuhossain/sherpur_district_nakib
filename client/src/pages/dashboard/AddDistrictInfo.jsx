import React from "react";
import axios from "axios";
import DashboardLayout from "./layout";
import "suneditor/dist/css/suneditor.min.css";
import CustomEditor from "../../components/CustomEditor";

const AddDistrictInfo = () => {
  const [districtInfoList, setDistrictInfoList] = React.useState([]);
  const [postLoading, setPostLoading] = React.useState(false);
  const [isPostAdded, setIsPostAdded] = React.useState(false);
  const [isPostPublished, setIsPostPublished] = React.useState(false);
  const [editorContent, setEditorContent] = React.useState("");

  React.useEffect(() => {
    axios
      .get(`${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/district-info`)
      .then((res) => {
        setDistrictInfoList(res.data);
      });
  }, []);

  const handleIsPostAdded = () => {
    setIsPostAdded(!isPostAdded);
  };

  const handleIsPostPublished = () => {
    setIsPostPublished(!isPostPublished);
  };

  const handleCreatePost = async (e) => {
    e.preventDefault();
    setPostLoading(true);
    const payload = {
      title: e.target["title"].value,
    };
    const formData = new FormData();
    formData.append("payload", JSON.stringify(payload));
    if (isPostAdded) {
      formData.append(
        "post",
        JSON.stringify({
          postTitle: e.target["postTitle"].value,
          content: e.target["content"].value,
          isVisible: isPostPublished,
        })
      );
      formData.append("image", e.target["bannerImg"].files[0]);
    }
    try {
      axios
        .post(
          `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/district-info`,
          formData,
          {
            withCredentials: true,
            headers: {
              "Content-Type": "multipart/form-data",
            },
          }
        )
        .then((res) => {
          setDistrictInfoList([...districtInfoList, res.data]);
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    } finally {
      setPostLoading(false);
    }
  };

  const handleDeletePost = async (id) => {
    try {
      axios
        .delete(
          `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/district-info/${id}`,
          { withCredentials: true }
        )
        .then((res) => {
          console.log(res);
          if (res.status === 204) {
            const newDistrictInfoList = districtInfoList.filter(
              (info) => info.id !== id
            );
            setDistrictInfoList(newDistrictInfoList);
          }
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    }
  };

  return (
    <DashboardLayout>
      <h2 className="mb-6 text-center text-3xl font-bold text-gray-900">
        জেলা পরিচিতি
      </h2>

      {districtInfoList.length > 0 ? (
        <table className="border-separate w-full border-spacing-y-2 text-sm">
          <thead className="text-left">
            <tr>
              <th className="ps-4">ID</th>
              <th className="ps-4">Title</th>
              <th className="ps-4">Available blog</th>
              <th className="ps-4">Actions</th>
            </tr>
          </thead>
          <tbody>
            {districtInfoList.map((info) => (
              <tr key={info.id}>
                <td className="td-class">{info.id}</td>
                <td className="td-class">{info.title}</td>
                <td className="td-class">{info.postId}</td>
                <td className="td-class">
                  <button onClick={() => handleDeletePost(info.id)}>
                    <svg
                      clipRule="evenodd"
                      fillRule="evenodd"
                      strokeLinejoin="round"
                      strokeMiterlimit="2"
                      viewBox="0 0 24 24"
                      width="24"
                      height="24"
                      fill="currentColor"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        d="m4.015 5.494h-.253c-.413 0-.747-.335-.747-.747s.334-.747.747-.747h5.253v-1c0-.535.474-1 1-1h4c.526 0 1 .465 1 1v1h5.254c.412 0 .746.335.746.747s-.334.747-.746.747h-.254v15.435c0 .591-.448 1.071-1 1.071-2.873 0-11.127 0-14 0-.552 0-1-.48-1-1.071zm14.5 0h-13v15.006h13zm-4.25 2.506c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm-4.5 0c-.414 0-.75.336-.75.75v8.5c0 .414.336.75.75.75s.75-.336.75-.75v-8.5c0-.414-.336-.75-.75-.75zm3.75-4v-.5h-3v.5z"
                        fillRule="nonzero"
                      />
                    </svg>
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p className="bg-gray-100 ps-2 rounded-md">কোন তথ্য পাওয়া যায়নি</p>
      )}

      <h6 className="mb-4 mt-10 font-bold text-gray-900">
        নতুন জেলা পরিচিতি যোগ করুন
      </h6>
      <form
        onSubmit={handleCreatePost}
        className="border border-gray-300 rounded-md"
      >
        <input
          required
          name="title"
          type="text"
          className="appearance-none rounded-none relative block w-full px-3 py-2 border-b  border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="Main Title"
        />
        <div className="px-3 py-2 flex flex-col space-y-2">
          <label className="inline-flex items-center cursor-pointer">
            <span className="me-3 text-sm text-gray-900">
              Will you add blog?
            </span>
            <input
              type="checkbox"
              value={isPostAdded}
              onChange={handleIsPostAdded}
              className="sr-only peer"
            />
            <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
          </label>
          {isPostAdded && (
            <label className="inline-flex items-center cursor-pointer">
              <span className="me-3 text-sm text-gray-900">
                Will you publish the blog?
              </span>
              <input
                type="checkbox"
                value={isPostPublished}
                onChange={handleIsPostPublished}
                className="sr-only peer"
              />
              <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
            </label>
          )}
        </div>
        <CustomEditor
          editorContent={editorContent}
          setEditorContent={setEditorContent}
          isPostAdded={isPostAdded}
        />
        <button
          type="submit"
          className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-b-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          {postLoading ? (
            <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
          ) : (
            "Create"
          )}
        </button>
      </form>
    </DashboardLayout>
  );
};

export default AddDistrictInfo;
