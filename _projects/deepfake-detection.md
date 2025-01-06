---
layout: page
title: Context-Aware Deepfake-Detection
description: Deepfake Detection using real-world YouTube and Reddit data.
img: assets/img/Deepfake_thumbnail.png
importance: 2
category: Projects
giscus_comments: false
---

***
### Introduction
***
<div style="text-align: justify"> The rise of deepfake technology facilitated by state-of-the-art ML algorithms, has spurred an urgent need for robust detection systems due to its potential for misuse. The sophistication of deepfake technology undermines trust, making it difficult to distinguish genuine from manipulated audio-visual content. Researchers propose solutions such as HMCAN, using multi-modal context and hierarchical text semantics, and FakeNewsGPT4, showing promise against diverse and high-quality online deepfakes.</div><br/>

<table>
  <tr>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/Obama_Real.gif" alt="President Obama's Legitimate photo" width="400">
            <p>Fig. 1 President Obama's Legitimate photo</p>
        </div>
    </td>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/Obama_Deepfake.gif" alt="President Obama's Deepfake" width="435">
            <p>Fig. 2 President Obama's Deepfake photo</p>
        </div>
    </td>
  </tr>
</table>

***
### Related Work
***
<div style="text-align: justify"> 
Shengsheng Qian et al. proposed HMCAN, a unified deep model to tackle challenges by jointly modeling multi-modal context and hierarchical text semantics. It introduces three innovations: 
</div>

- Utilizing ResNet for image representation and BERT for textual content embedding.
- Introducing a multi-modal contextual attention network to fuse inter and intra-modality relationships.
- Designing a hierarchical encoding network for rich semantics in fake news detection. Experimental results validate HMCAN's effectiveness.

<div style="text-align: justify"> 
FakeNewsGPT4 by Xuannan Liu et al. is a novel framework for multimodal fake news detection. It leverages world knowledge from LVLMs and specific forgery-related knowledge to address domain shift. FakeNewsGPT4 incorporates two critical types of knowledge: a multi-level crossmodal reasoning module focusing on semantic correlations and a dual-branch fine-grained verification module encoding artifact traces. Awotunde et al. propose a ResNet-50-LSTM hybrid model enhancing deepfake detection, exhibiting effectiveness on Celeb-DF and Face Forensic++.
</div>

***
### Dataset Description
***
<div style="text-align: justify"> 
This project aims to find if a video on social media such as YouTube and Reddit is a deepfake by</div>
- Employing r/Fakeddit Dataset to analyze the metadata extracted from posts on reddit.
- Creating a custom dataset of 1298 YouTube videos with comments, description and title using the YouTube API. The video selection criteria was biased towards political figures and celebrities, as their deepfakes predominant, and are targets often.
 
#### Dataset Links
- [Dataset used for videos](https://gtvault-my.sharepoint.com/:f:/g/personal/km304_gatech_edu/EiUZqiAHoMtDhIBLjmt-x6IBGj_wQxAXf7-KZe-LHhgmYQ?e=m3Jtvk)
- [Dataset used for metadata](https://gtvault-my.sharepoint.com/:f:/g/personal/km304_gatech_edu/EtIGWb6y6xlNnSQShM0TYJgBHtYMGzWVEvc4Ktm1ohgKuA?e=SWbnXS)
- [r/Fakeddit paper](https://aclanthology.org/2020.lrec-1.755.pdf)

***
### Data Preprocessing Methods
***
The preprocessing methods help in cleaning and preparing both text and image data for further analysis or modeling tasks. Several data preprocessing methods were used for both text and image data. The steps followed in text and image data preprocessing are given below:

#### **Text Data Preprocessing**

- **Remove Unwanted Text Patterns:**
   - The text data preprocessing starts by cleaning metadata. We start by splitting the text based on <sep> tags and iteratively apply various cleaning operations.
   - These operations include removing HTML tags, URLs, unnecessary whitespace, and characters like '&#39#'. 
   - Additionally, we ensure that the cleaned text does not exceed a predefined limit of 3500 characters per comment, by concatenating individual cleaned texts until the limit is reached. 
   - Overall, these steps aim to sanitize the metadata text for further processing.

- **De-emojize and remove colons:**
   - In the second step of data preprocessing, we utilize the emoji library to demojize text, converting emojis to their textual representations. 
   - Additionally, it removes colons from the text by replacing them with spaces.
   - These operations are applied iteratively to each cleaned text entry in the list.

- **Language Translation for Standardization**
   - In the third step of data preprocessing, the code translates text written in foreign languages to English, using the `Google Translate API`. 
   - The translated text replaces the original text in the cleaned text list.
   - By translating foreign language text to English, this step ensures consistency and uniformity in the dataset, facilitating easier analysis and interpretation of the metadata content.

- **Abbreviation and Contraction Expansion:**
   - In the fourth step of data preprocessing, we utilize the contractions library to expand abbreviations and contractions within the text. 
   - The `fix()` function from the contractions library is applied to expand any identified contractions or abbreviations. 
   - If the text is not a string type, it is replaced with an empty string.

- **Punctuation Removal:** 
   - In the fifth step of data preprocessing, we try to remove punctuations from the cleaned text. 
   - Within a loop iterating through each cleaned text entry, the `translate()` method with `str.maketrans()` is employed to remove all punctuations using string.punctuation. 
   - Additionally, any leading or trailing whitespaces are stripped from the text.
   
- **Colloquialism Expansion:**  
   - In the sixth step of data preprocessing, we define a dictionary abbreviations containing colloquial abbreviations and their expanded forms. 
   - Then, a function `expand_slang()` is implemented to expand these colloquialisms within the text. 
   - The `expand_slang()` function is applied to replace any identified colloquial abbreviations with their expanded forms.
   
- **Lowercasing Text:**
   - In the seventh step of data preprocessing, we converts all text to lowercase.
   - Within a loop iterating through each cleaned text entry, the `lower()` method is applied to transform the text to lowercase characters.
   
- **Lemmatization**   
   - In the eighth step of data preprocessing, we define a function `lemmatize_text()` to perform lemmatization on the text. 
   - Within the function, the `NLTK library` is used to tokenize the text into words, and each token is lemmatized using the WordNetLemmatizer. 
   - The lemmatized tokens are then joined back into a text string. Within a loop iterating through each cleaned text entry, the `lemmatize_text()` function is applied to lemmatize the text. This step helps in reducing words to their base or dictionary form, facilitating better analysis by treating different inflections of words as the same entity.
   
- **Conversion to String:**
   - In the ninth and final step of data preprocessing, we concatenate the list of cleaned text entries into a single string. 
   - This is achieved using the `join()` method, which combines the elements of the list into a single string with spaces between them. 
   - If the cleaned_text list is empty or not present, an empty string is returned.
   
 The below table illustrates certain example texts that were obtained on YouTube, and how it would look after it goes through all of the pre-processing techniques mentioned above

<table style="border-collapse: collapse; width: 70%; margin: 0 auto;">
    <thead>
        <tr>
            <th style="border: 2px solid white; text-align: center; padding: 8px;">Original Comment on YouTube</th>
            <th style="border: 2px solid white; text-align: center; padding: 8px;">Comment after pre-processing</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">සුබ.අලුත්.අවුරැද්දක්.වෙවා.❤❤❤❤❤❤🙏🙏🙏</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;"><center>happy new year heart heart heart <br> heart heart heart folded hand <br> folded hand folded hand</center></td>
        </tr>
        <tr>
            <td style="border: 2px solid white; text-align: center; padding: 8px;">Классный комик , талантливый комик</td>
            <td style="border: 2px solid white; text-align: center; padding: 8px;"><center>cool comedian<br>talented comedian</center></td>
        </tr>
    </tbody>
</table>
<br/>

#### **Video Data Preprocessing**
<div style="text-align: justify;">
The preprocessing of collected videos involves performing statistical analysis to understand their durations. A histogram is used to visualize the video durations before clipping, revealing that many videos exceed 200 seconds. To improve training efficiency, videos with durations greater than or equal to 60 seconds are clipped.

The clipping process involves extracting properties such as FPS, frame count, width, height, and duration. Videos longer than 60 seconds are processed by calculating the middle frame, followed by extracting 900 frames (30 seconds at 30 FPS) centered around this frame. The resulting clipped videos are then saved, ensuring all videos have durations under 60 seconds. <br/><br/>

</div>

<table>
  <tr>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/histogram_of_video_durations_before_clipping.jpeg" alt="Histogram of Videos before clipping" width="435">
            <p>Fig. 3 Histogram of Videos before clipping</p>
        </div>
    </td>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/histogram_of_video_durations_after_clipping.jpeg" alt="Histogram of Videos after clipping" width="435">
            <p>Fig. 4 Histogram of Videos after clipping</p>
        </div>
    </td>
  </tr>
</table>
   
The frame rate of each video is increased to 30 FPS by determining the number of interpolated frames needed to achieve the desired output frame rate of 30 FPS. Interpolated frames are generated by iteratively interpolating between each frame of the video, using linear interpolation between the current and previous frames. The number of interpolated frames is determined by the ratio between the output frame rate and the original frame rate. The plot below illustrates the comparison between the FPS of the original and transformed videos.

<div style="text-align: center;">
    <img src="../../assets/img/comparison_of_fps_between_original_and_transformed_videos.jpeg" alt="Comparing FPS before and after transformation." width="435">
    <p>Fig. 5 Comparing FPS before and after transformation.</p>
</div>
   
The pre-processing methods done for the image franes obtained from the video is given below.   
 
1. **Image Loading:**
   - Loading images using `tf.keras.preprocessing.image.load_img`.

2. **Resizing:**
   - Resizing images to a fixed size (224x224 pixels in this case) using `tf.keras.preprocessing.image.img_to_array` and `resize`.

3. **Normalization:**
   - Normalizing pixel values to the range [0, 1] by dividing by 255.0.
   - This ensures that the input features (pixel values) are within a similar scale, which helps in training deep learning models effectively.

4. **Grayscale Conversion:**
   - Converting images to grayscale using the `convert('L')` method of the PIL library.
   - Rescaling pixel values to the range [0, 1] by dividing by 255.0.
   - Grayscale conversion can simplify the image representation by reducing the number of color channels from 3 (RGB) to 1.

5. **Adding Random Noise:**
   - Adding random noise to the image.
   - Random noise is added to the pixel values of the image to make it more robust to variations in input data.
   - The noise factor controls the intensity of the noise added.

Fig. 6 and 7 provides visualization of metadata after preprocessing, using a word cloud to depict both normal and deepfake metadata.

<table>
  <tr>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/wordcloud_normal.jpeg" alt="Wordcloud for Normal Videos" width="435">
            <p>Fig. 6 Wordcloud for Normal Videos</p>
        </div>
    </td>
    <td>
        <div style="text-align: center;">
            <img src="../../assets/img/wordcloud_deepfake.jpeg" alt="Wordcloud for Deepfake Videos" width="435">
            <p>Fig. 7 Wordcloud for Deepfake Videos</p>
        </div>
    </td>
  </tr>
</table>

***
### **Methodology**
***
<div style="text-align: justify;">
This project reimplements the <strong>Hierarchical Multi-modal Contextual Attention Network (HMCAN)</strong> model proposed by Qian <em>et. Al</em> (Fig. 8) from scratch. The HMCAN model addresses the limitations of existing methods by jointly modeling multi-modal context information and the hierarchical semantics of text in a unified deep model. <br/><br/>

The methodology consists of three key technical innovations. First, the authors utilize <strong>ResNet and BERT</strong>, a powerful text-pretrained deep model, to embed the textual content of news. This allows for the extraction of rich features from both visual and textual modalities. Second, a <strong>multi-modal contextual attention network</strong> is introduced to fuse both inter-modality and intra-modality relationships. This network is designed to capture the complementary information present in multi-modal contexts, thereby enhancing the understanding of multi-modal data. Third, a <strong>hierarchical encoding network</strong> to capture the rich hierarchical semantics of the multi-modal data was employed. This network is intended to address the challenge of fully utilizing the multi-modal context information and extracting high-order complementary information to improve the performance of deepfake detection. The HMCAN methodology aims to provide a more effective and robust approach to deepfake detection by leveraging multi-modal context information and the hierarchical semantics of text.<br/><br/>
</div>

<table style="margin: 0 auto; text-align: center;">
  <tr>
    <td style="text-align: center;">
      <img src="../../assets/img/Hmcan.png" alt="HMCAN model" width="700">
      <p>Fig. 8 The HMCAN model</p>
    </td>
  </tr>
</table>


***
### Results
***
<table>
    <tr>
        <td>
            <div style="text-align: center;">
                <img src="../../assets/img/loss.jpeg" alt="Loss plot" width="435">
                <p>Fig. 9 Loss plot</p>
            </div>
        </td>
        <td>
            <div style="text-align: center;">
                <img src="../../assets/img/Validation_loss_per_epoch.jpeg" alt="Validation loss per epoch plot" width="435">
                <p>Fig. 10 Validation loss per epoch plot</p>
            </div>
        </td>
    </tr>
        <td>
            <div style="text-align: center;">
                <img src="../../assets/img/train_loss_per_iteration.jpeg" alt="Training Loss Per Iteration" width="435">
                <p>Fig. 11 Training Loss Per Iteration</p>
            </div>
        </td>
        <td>
            <div style="text-align: center;">
                <img src="../../assets/img/train_accuracy_per_iteration.jpeg" alt="Training Accuracy Per Iteration" width="435">
                <p>Fig. 12 Training Accuracy Per Iteration</p>
            </div>
        </td>
</table>


<table style="margin: 0 auto; text-align: center;">
    <tr>
        <td style="text-align: center;">
            <img src="../../assets/img/training_results.png" alt="Training Results" width="800">
            <p>Fig. 13 Training Results</p>
        </td>
    </tr>
</table>
   
### References
* * *
1.  Shengsheng Qian, Jinguang Wang, Jun Hu, Quan Fang, and Changsheng Xu. 2021. Hierarchical Multi-modal Contextual Attention Network for Fake News Detection. In Proceedings of the 44th International ACM SIGIR Conference on Research and Development in Information Retrieval (SIGIR ’21), July 11–15, 2021, Virtual Event, Canada. ACM, New York, NY, USA, 10 pages.
2.  Liu, Xuannan, et al. "FakeNewsGPT4: Advancing Multimodal Fake News Detection through Knowledge-Augmented LVLMs." arXiv preprint arXiv:2403.01988 (2024).
3.  Awotunde, J.B.; Jimoh, R.G.; Imoize, A.L.; Abdulrazaq, A.T.; Li, C.-T.; Lee, C.-C. “An Enhanced Deep Learning-Based DeepFake Video Detection and Classification System”, Electronics 2023, 12, 87.
4.  D. Pan, L. Sun, R. Wang, X. Zhang and R. O. Sinnott, “Deepfake Detection through Deep Learning,” 2020 IEEE/ACM International Conference on Big Data Computing, Applications and Technologies (BDCAT)”, pp. 134-143.
5.  A. Haliassos, K. Vougioukas, S. Petridis and M. Pantic, “Lips Don’t Lie: A Generalisable and Robust Approach to Face Forgery Detection,” 2021 IEEE/CVF Conference on Computer Vision and Pattern Recognition (CVPR)”, 2021, pp. 5037-5047.
6.  Gong, L.Y.; Li, X.J. “A Contemporary Survey on Deepfake Detection: Datasets, Algorithms, and Challenges”, Electronics 2024, 13, 585.