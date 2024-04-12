/* eslint-disable react/prop-types */
import React from "react";
import axios from "axios";
import Editor from "suneditor-react";
import "suneditor/dist/css/suneditor.min.css";

const CustomEditor = ({ editorContent, setEditorContent, isPostAdded }) => {
  const editor = React.useRef();
  const [selectedBannerImg, setSelectedBannerImg] = React.useState(undefined);
  const [contentImgLoading, setContentImgLoading] = React.useState(false);
  const getSunEditorInstance = (sunEditor) => {
    editor.current = sunEditor;
  };

  const handleBannerImgPreview = (e) => {
    if (e.target.files && e.target.files[0]) {
      setSelectedBannerImg(URL.createObjectURL(e.target.files[0]));
    }
  };

  function onImageUploadBefore() {
    return (files, _info, uploadHandler) => {
      async () => {
        setContentImgLoading(true);
        const formData = new FormData();
        formData.append("image", files[0]);
        try {
          axios
            .post(
              `${import.meta.env.VITE_APP_PUBLIC_SERVER}/api/upload/single`,
              formData
            )
            .then((resp) => {
              if (resp.status === 201) {
                const imgURL = resp.data.filename;
                const res = {
                  result: [
                    {
                      url: imgURL,
                      name: "thumbnail",
                    },
                  ],
                };
                uploadHandler(res);
              } else alert("Failed to upload image");
            })
            .catch((err) => {
              console.log(err);
            });
        } catch (error) {
          console.log(error.message);
        } finally {
          setContentImgLoading(false);
        }
      };
      // called here for stop double image
      uploadHandler();
    };
  }
  if (isPostAdded) {
    return (
      <div>
        <div className="px-3 pb-2">
          <label className="block">
            <span className="sr-only">Choose profile photo</span>
            <input
              type="file"
              name="bannerImg"
              className="block w-full text-sm text-slate-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-violet-200 file:text-violet-700 hover:file:bg-violet-100"
              onChange={handleBannerImgPreview}
            />
          </label>
          <div className="w-1/3">
            {selectedBannerImg && (
              <img
                className="w-fit mt-2"
                src={selectedBannerImg}
                alt="thumbnail"
              />
            )}
          </div>
          {contentImgLoading && (
            <div className="animate-spin rounded-full h-5 w-5 my-2 border-b-2 border-indigo-600"></div>
          )}
        </div>
        <input
          required
          name="postTitle"
          type="text"
          className="appearance-none rounded-none relative block w-full px-3 py-2 border-t border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="Post Title"
        />
        <Editor
          name="content"
          value={editorContent}
          onChange={setEditorContent}
          getSunEditorInstance={getSunEditorInstance}
          onImageUploadBefore={onImageUploadBefore()}
          placeholder="Write"
          setOptions={{
            buttonList: [
              [
                "fontSize",
                "bold",
                "italic",
                "underline",
                "strike",
                "blockquote",
                "link",
                "image",
                "align",
              ],
            ],
          }}
          height="40vh"
        />
      </div>
    );
  } else {
    return null;
  }
};

export default CustomEditor;
